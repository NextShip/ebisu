require_dependency "ebisu/application_controller"

module Ebisu
  class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
      @articles = Article.where(category_id: params[:id])
    end
  end
end
