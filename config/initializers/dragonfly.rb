require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "f0f29ee054b86a6b2abcd526a057d8b1432bf2a89c7ba62caab4446b05de050a"

  url_format "/media/:job/:name"

  datastore Ebisu.config.image_store_type, Ebisu.config.image_store_attributes
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
