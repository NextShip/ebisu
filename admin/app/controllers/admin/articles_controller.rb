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
      @article = Ebisu::Article.new(article_params)

      params[:article][:paragraphs_attributes].each do |index, attributes|
        next if index.to_i < 0
        @article.build_paragraph(attributes)
      end

      if @article.save
        redirect_to @article
      else
        flash.now[:alert] = @article.errors.full_messages.join(' ')
        render :new
      end
    end

    private
    def article_params
      params.require(:article).permit(:title, :abstract)
    end
  end
end