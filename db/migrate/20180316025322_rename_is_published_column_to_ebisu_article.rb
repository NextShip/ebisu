class RenameIsPublishedColumnToEbisuArticle < ActiveRecord::Migration[5.1]
  def change
    rename_column :ebisu_articles, :is_published, :published
  end
end
