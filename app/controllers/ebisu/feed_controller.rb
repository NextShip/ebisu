require_dependency "ebisu/application_controller"

module Ebisu
  class FeedController < ApplicationController
    layout false

    def index
      @articles = Ebisu::Article.published.page(params[:page])

      respond_to do |format|
        format.atom
      end
    end

    def nordot
      @articles = Ebisu::Article.published.page(params[:page])

      respond_to do |format|
        format.rss
      end
    end

    def gunocy
      @articles = Ebisu::Article.published.page(params[:page])

      respond_to do |format|
        format.rss
      end
    end
  end
end
