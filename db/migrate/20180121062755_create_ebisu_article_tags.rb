class CreateEbisuArticleTags < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_article_tags do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
  end
end