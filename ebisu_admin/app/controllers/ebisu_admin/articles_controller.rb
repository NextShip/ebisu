require_dependency "ebisu_admin/application_controller"

module EbisuAdmin
  class ArticlesController < ApplicationController
    def index
      @q = Ebisu::Article.ransack(params[:q])
      @q.sorts = 'id desc' if @q.sorts.empty?
      @articles = @q.result.page(params[:page])
      authorize Ebisu::Article
    end

    def show
      @article = Ebisu::Article.find(params[:id])
      authorize @article
    end

    def new
      @article = Ebisu::Article.new
      @article.user = current_user
      @article.build_paragraph(type: "Ebisu::Paragraph::Headline")
      @article.build_paragraph(type: "Ebisu::Paragraph::Body")
      authorize @article
    end

    def create
      attributes = article_params
      @article = Ebisu::Article.new(attributes)
      @article.user = current_user
      authorize @article

      if @article.save
        redirect_to @article
      else
        render :new
      end
    end

    def edit
      @article = Ebisu::Article.find(params[:id])
      authorize @article
    end

    def update
      attributes = article_params
      @article = Ebisu::Article.find(params[:id])
      authorize @article

      if @article.update_attributes(attributes)
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      @article = Ebisu::Article.find(params[:id])
      authorize @article
      if @article.destroy
        redirect_to articles_path
      else
        flash.now[:alert] = @article.errors.full_messages
        redirect_to @article
      end
    end

    def publish
      @article = Ebisu::Article.find(params[:id])
      if @article.published?
        flash[:alert] = "This article has been published."
      else
        @article.published = true
        if @article.save
          flash[:notice] = "This article is published."
        else
          flash[:alert] = @article.errors.full_messages
        end
      end
      redirect_to @article
    end

    private
    def article_params
      params.require(:article).permit(:title, :abstract, :image, :category_id, :user_id, :published, :published_at, tag_ids: [], paragraphs_attributes: [:template, :type, :position, :id, :_destroy, delegate_attributes: [ :content, :id, :source, :source_url, :url ]])
    end
  end
end
