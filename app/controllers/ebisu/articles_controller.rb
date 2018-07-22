require_dependency "ebisu/application_controller"
require "browser"

module Ebisu
  class ArticlesController < ApplicationController
    def index
      @articles = Article.published.page(params[:page])
      authorize @articles
      # ordered by viewed
      # @most_viewed_in_month = Article.where(published_at: [Date.today.beginning_of_month..Date.today]).order(impressions_count: :desc).take(3)
    end

    def show
      @article = Article.includes(paragraphs: :delegate).find(params[:id])
      authorize @article
      impressionist @article, nil, unique: [:session_hash]

      @index = []
      @article.paragraphs.rank(:position).each do |paragraph|
        if paragraph.is_a? Ebisu::Paragraph::Headline
          @index.push([paragraph])
        elsif paragraph.is_a? Ebisu::Paragraph::Subheadline
          @index.last.push(paragraph)
        end
      end

      category = @article.category
      add_breadcrumb "Top", articles_path
      add_breadcrumb category.parent.name, category_path(category.parent) if category.respond_to?(:parent) && category.present?
      add_breadcrumb category.name, category_path(@article.category) if category
      add_breadcrumb @article.title

      set_meta_tags title: @article.title, description: @article.abstract
    end
  end
end
