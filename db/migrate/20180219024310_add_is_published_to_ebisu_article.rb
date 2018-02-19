class AddIsPublishedToEbisuArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :ebisu_articles, :is_published, :boolean, default: false, null: false
  end
end
