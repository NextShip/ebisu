require_dependency "ebisu/application_controller"
require "browser"

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
