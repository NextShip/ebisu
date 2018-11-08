require 'ebisu/config.rb'

module Ebisu
  class Engine < ::Rails::Engine
    isolate_namespace Ebisu
    initializer "ebisu assets precompile" do |app|
      app.config.assets.precompile += %w(ebisu/_custom.scss)
    end
  end
end
