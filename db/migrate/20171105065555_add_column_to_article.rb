class AddColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :ebisu_articles, :image_uid, :string
  end
end
