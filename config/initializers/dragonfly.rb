require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app(:ebisu).configure do
  plugin :imagemagick
  verify_urls true
  secret "f0f29ee054b86a6b2abcd526a057d8b1432bf2a89c7ba62caab4446b05de050a"
  url_format "/ebisu/:job/:name"

  if ENV['EBISU_AWS_BUCKET_NAME']
    response_header 'Cache-Control' do |job, request, headers|    # either directly or with a block
      job.image? ? "public, max-age=315360000" : "private"         # setting to nil removes the header
    end
    datastore :s3,
      bucket_name: ENV['EBISU_AWS_BUCKET_NAME'],
      access_key_id: ENV['EBISU_AWS_ACCESS_KEY_ID'], 
      secret_access_key: ENV['EBISU_AWS_SECRET_ACCESS_KEY'],
      region: ENV['EBISU_AWS_REGION'],
      url_scheme: 'https'
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end

  # Override the .url method...
  define_url do |app, job, opts|
    thumb = Ebisu::Thumbnail.find_by_signature(job.signature)
    # If (fetch 'some_uid' then resize to '40x40') has been stored already, give the datastore's remote url ...
    if thumb
      app.datastore.url_for(thumb.uid)
    # ...otherwise give the local Dragonfly server url
    else
      app.server.url_for(job)
    end
  end

  # Before serving from the local Dragonfly server...
  before_serve do |job, env|
    # ...store the thumbnail in the datastore...
    uid = job.store

    # ...keep track of its uid so next time we can serve directly from the datastore
    Ebisu::Thumbnail.create!(uid: uid, signature: job.signature)
  end

end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware, :ebisu

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
