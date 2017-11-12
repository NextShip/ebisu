require_dependency "ebisu/application_controller"

module Ebisu
  class ArticlesController < ApplicationController
    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end
  end
end
