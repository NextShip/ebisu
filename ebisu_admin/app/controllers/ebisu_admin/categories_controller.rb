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
        redirect_to @category
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :new
      end
    end

    def edit
      @category = Ebisu::Category.find(params[:id])
    end

    def update
      @category = Ebisu::Category.find(params[:id])

      if @category.update(category_params)
        redirect_to @category
      else
        flash.now[:alert] = @category.errors.full_messages
        render :edit
      end
    end

    def destroy
      @category = Ebisu::Category.find(params[:id])
      if @category.destroy
        redirect_to categories_path
      else
        flash.now[:alert] = @category.errors.full_messages
        redirect_to @category
      end
    end

    private
    def category_params
      params.require(:category).permit(:name, :id)
    end
  end
end