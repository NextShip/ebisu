require_dependency "ebisu/application_controller"
require "browser"

module Ebisu
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
      # ordered by viewed
      # @most_viewed_in_month = Article.where(published_at: [Date.today.beginning_of_month..Date.today]).order(impressions_count: :desc).take(3)
    end

    def show
      @article = Article.find(params[:id])
      impressionist @article, nil, unique: [:session_hash]
    end
  end
end
