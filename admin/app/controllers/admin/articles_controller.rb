require_dependency "admin/application_controller"

module Admin
  class ArticlesController < ApplicationController
    def index
      @articles = Ebisu::Article.all
    end

    def show
      @article = Ebisu::Article.find(params[:id])
    end

    def new
      @article = Ebisu::Article.new
    end
  end
end