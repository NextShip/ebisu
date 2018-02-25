require_dependency "ebisu/application_controller"


module Ebisu
  class RssController < ApplicationController
    layout false

    def index
      @articles = Ebisu::Article.published.limit(10)

      respond_to do |format|
        format.rss
      end
    end
  end
end
