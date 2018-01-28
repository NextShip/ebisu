class CreateEbisuThumbnails < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_thumbnails do |t|
      t.string :signature
      t.string :uid

      t.timestamps
    end
  end
end
