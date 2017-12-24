module Ebisu
  module ArticleViewHelper
    def render_article_panel(article)
      render 'ebisu/articles/panel', article: article
    end
  end
end
