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
      @article.build_headline
      @article.build_body
    end

    def create
      @article = Ebisu::Article.new(article_params)

      params[:article][:paragraphs_attributes].each do |index, attributes|
        attributes[:position] = index
        @article.build_paragraph(attributes)
      end

      if @article.save
        render article_path(@article)
      else
        redirect_to :new
      end
    end

    private
    def article_params
      params.require(:article).permit(:title, :abstract)
    end
  end
end