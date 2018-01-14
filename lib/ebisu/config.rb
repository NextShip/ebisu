module Ebisu
	class Config
    include ActiveSupport::Configurable

    config_accessor :image_store_type
    config_accessor :image_store_attributes
  end

  def self.configure(&block)
    yield config
  end

  def self.config
    @config ||= Config.new
  end
end