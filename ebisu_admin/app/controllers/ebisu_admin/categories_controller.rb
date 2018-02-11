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
      @category = Ebisu::Category::Sort.new
    end

    def create
      @category = Ebisu::Category::Sort.new(category_params)
      if @category.save
        redirect_to categories_path
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :new
      end
    end

    private
    def category_params
      params.require(:category_sort).permit(:type, :name, children_attributes: [:id, :type, :name, :_destroy])
    end
  end
end
