require 'ebisu/article_view_helper'
require 'ebisu/config.rb'

module Ebisu
  class Engine < ::Rails::Engine
    isolate_namespace Ebisu
    initializer 'ebisu.action_view_helpers' do
      ActiveSupport.on_load :action_view do
        include Ebisu::ArticleViewHelper
      end
    end
  end
end
