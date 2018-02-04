require_dependency "ebisu_admin/application_controller"

module EbisuAdmin
  class CategoriesController < ApplicationController
    def index
      @categories = Ebisu::Category.all
    end

    def show
      @category = Ebisu::Category.find(params[:id])
    end

    def new
      @category = Ebisu::Category.new
    end

    def create
      @category = Ebisu::Category.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        render :new
      end
    end

    private
    def category_params
      params.require(:category).permit(:name, children_attributes: [:id, :name, :_destroy])
    end
  end
end
