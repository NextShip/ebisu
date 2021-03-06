require_dependency "ebisu/application_controller"

module Ebisu
  class CategoriesController < ApplicationController
    def show
      @category = Category.find(params[:id])
      @articles = Article.published.where(category_id: params[:id]).page(params[:page])

      add_breadcrumb "Top", articles_path
      add_breadcrumb @category.parent.name, category_path(@category.parent) if @category.respond_to?(:parent) && @category.parent.present?
      add_breadcrumb @category.name

      set_meta_tags title: "#{@category.name}に関する記事一覧", description: @category.description
    end
  end
end
