require_dependency "ebisu_admin/application_controller"

module EbisuAdmin
  class CategoriesController < ApplicationController
    def index
      @categories = Ebisu::Category::Sort.all
      authorize Ebisu::Category
    end

    def show
      @category = Ebisu::Category.find(params[:id])
      authorize Ebisu::Category
    end

    def new
      @category = Ebisu::Category::Sort.new
      authorize Ebisu::Category
    end

    def create
      @category = Ebisu::Category::Sort.new(category_params)
      authorize Ebisu::Category
      if @category.save
        redirect_to categories_path
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :new
      end
    end

    def edit
      @category = Ebisu::Category.find(params[:id])
      authorize Ebisu::Category
    end

    def update
      @category = Ebisu::Category.find(params[:id])
      authorize Ebisu::Category
      if @category.update(category_params)
        redirect_to category_path(@category)
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :edit
      end
    end

    def destroy
      @category = Ebisu::Category.find(params[:id])
      authorize Ebisu::Category
      if @category.destroy
        redirect_to categories_path
      else
        flash.now[:alert] = @category.errors.full_messages
        redirect_to @category
      end
    end

    private
    def category_params
      params.require(:category_sort).permit(:type, :name, children_attributes: [:id, :type, :name, :_destroy])
    end
  end
end
