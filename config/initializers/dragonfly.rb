require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick
  protect_from_dos_attacks true
  secret "f0f29ee054b86a6b2abcd526a057d8b1432bf2a89c7ba62caab4446b05de050a"
  url_format "/media/:job/:name"

  if ENV['EBISU_AWS_BUCKET_NAME']
    response_header 'Cache-Control' do |job, request, headers|    # either directly or with a block
      job.image? ? "public, max-age=315360000" : "private"         # setting to nil removes the header
    end
    datastore :s3,
      bucket_name: ENV['EBISU_AWS_BUCKET_NAME'],
      access_key_id: ENV['EBISU_AWS_ACCESS_KEY_ID'], 
      secret_access_key: ENV['EBISU_AWS_SECRET_ACCESS_KEY'],
      region: ENV['EBISU_AWS_REGION']
  else
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
