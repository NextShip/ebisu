
Ebisu.configure do |config|
  # The datastore type for dragonfly used in ebisu internally.
  # Available options are: :file or :s3.
  config.image_store_type = :file

  # The configuration for datastore.
  config.image_store_attributes = {
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
  }
end
