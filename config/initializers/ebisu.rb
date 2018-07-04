
Ebisu.configure do |config|
  # The datastore type for dragonfly used in ebisu internally.
  # Available options are: :file or :s3.
  config.image_store_type = :file

  # The configuration for datastore.
  config.image_store_attributes = {
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
  }

  # Information for RSS generator.
  config.rss_feed_title = 'Ebisu RSS Feed'
  config.rss_feed_description = "The latest articles powered by Ebisu."
  config.logo_url = 'https://github.com/NextShip/ebisu'
end
