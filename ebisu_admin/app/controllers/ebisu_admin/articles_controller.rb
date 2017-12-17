require_dependency "ebisu_admin/application_controller"

module EbisuAdmin
  class ArticlesController < ApplicationController
    def index
      @articles = Ebisu::Article.all
    end

    def show
      @article = Ebisu::Article.find(params[:id])
    end

    def new
      @article = Ebisu::Article.new
      @article.build_paragraph(type: "Ebisu::Paragraph::Headline")
      @article.build_paragraph(type: "Ebisu::Paragraph::Body")
    end

    def create
      attributes = article_params
      attributes[:paragraphs_attributes].select! { |index, attributes| !attributes[:template] }
      @article = Ebisu::Article.new(attributes)

      if @article.save
        redirect_to @article
      else
        flash.now[:alert] = @article.errors.full_messages.join(' ')
        render :new
      end
    end

    def edit
      @article = Ebisu::Article.find(params[:id])
    end

    def update
      attributes = article_params
      attributes[:paragraphs_attributes].select! { |index, attributes| !attributes[:template] }
      @article = Ebisu::Article.find(params[:id])

      if @article.update_attributes(attributes)
        redirect_to @article
      else
        flash.now[:alert] = @article.errors.full_messages
        render :edit
      end
    end

    def destroy
      @article = Ebisu::Article.find(params[:id])
      if @article.destroy
        redirect_to articles_path
      else
        flash.now[:alert] = @article.errors.full_messages
        redirect_to @article
      end
    end

    private
    def article_params
      params.require(:article).permit(:title, :abstract, :image, paragraphs_attributes: [:template, :type, :position, :id, :_destroy, delegate_attributes: [ :content, :id ]])
    end
  end
end