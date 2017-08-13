class CreateEbisuArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_articles do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :category_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
