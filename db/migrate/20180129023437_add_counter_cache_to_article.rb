class AddCounterCacheToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :ebisu_articles, :impressions_count, :integer, default: 0
  end
end
