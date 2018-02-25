require_dependency "ebisu_admin/application_controller"

module EbisuAdmin
  class TagsController < ApplicationController
    def index
      @tags = Ebisu::Tag.all
      authorize Ebisu::Tag
    end

    def new
      @tag = Ebisu::Tag.new
      authorize Ebisu::Tag
    end

    def create
      @tag = Ebisu::Tag.new(tag_params)
      authorize Ebisu::Tag

      if @tag.save
        redirect_to tags_path
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :new
      end
    end

    def edit
      @tag = Ebisu::Tag.find(params[:id])
      authorize Ebisu::Tag
    end

    def update
      @tag = Ebisu::Tag.find(params[:id])
      authorize Ebisu::Tag

      if @tag.update(tag_params)
        redirect_to tags_path
      else
        flash.now[:alert] = @category.errors.full_messages.join(' ')
        render :edit
      end
    end

    def destroy
      @tag = Ebisu::Tag.find(params[:id])
      authorize Ebisu::Tag
      if !@tag.destroy
        flash.now[:alert] = @tag.errors.full_messages
      end
      redirect_to tags_path
    end

    private
    def tag_params
      params.require(:tag).permit(:name)
    end
  end
end