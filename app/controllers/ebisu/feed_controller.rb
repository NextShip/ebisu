require_dependency "ebisu/application_controller"

module Ebisu
  class FeedController < ApplicationController
    DEFAULT_FEED_PER = 100
    layout false

    def index
      @articles = Ebisu::Article.published.page(params[:page]).per(params[:per] || DEFAULT_FEED_PER)

      respond_to do |format|
        format.atom
      end
    end

    def nordot
      @articles = Ebisu::Article.published.page(params[:page]).per(params[:per] || DEFAULT_FEED_PER)

      respond_to do |format|
        format.rss
      end
    end

    def gunosy
      @articles = Ebisu::Article.published.page(params[:page]).per(params[:per] || DEFAULT_FEED_PER)

      respond_to do |format|
        format.rss
      end
    end

    def snf
      @articles = Ebisu::Article.published.page(params[:page]).per(params[:per] || DEFAULT_FEED_PER)

      respond_to do |format|
        format.rss
      end
    end
  end
end
