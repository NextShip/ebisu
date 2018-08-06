require 'ebisu/config.rb'

module Ebisu
  class Engine < ::Rails::Engine
    isolate_namespace Ebisu
  end
end
