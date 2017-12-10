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
      @article.build_paragraph(type: "Ebisu::Paragraph::Headline")
      @article.build_paragraph(type: "Ebisu::Paragraph::Body")
    end

    def create
      attributes = article_params
      attributes[:paragraphs_attributes].select! { |index, attributes| index.to_i >= 0 }
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
      attributes[:paragraphs_attributes].select! { |index, attributes| index.to_i >= 0 }
      @article = Ebisu::Article.find(params[:id])

      if @article.update_attributes(attributes)
        redirect_to @article
      else
        flash.now[:alert] = @article.errors.full_messages
        render :edit
      end
    end

    private
    def article_params
      params.require(:article).permit(:title, :abstract, :image, paragraphs_attributes: [:type, :position, :id, :_destroy, delegate_attributes: [ :content, :id ]])
    end
  end
end