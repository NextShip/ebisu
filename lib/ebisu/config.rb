module Ebisu
  class Config
    include ActiveSupport::Configurable
    
    config_accessor :image_store_type
    config_accessor :image_store_attributes
    # RSS
    config_accessor :rss_feed_title
    config_accessor :rss_feed_description
    config_accessor :logo_url
    config_accessor :google_analytics_id
  end
  
  def self.configure(&block)
    yield config
  end
  
  def self.config
    @config ||= Config.new
  end
end
