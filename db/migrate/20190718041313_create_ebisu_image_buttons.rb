class CreateEbisuImageButtons < ActiveRecord::Migration[5.2]
  def change
    create_table :ebisu_image_buttons do |t|
      t.integer :paragraph_id
      t.string :content_uid
      t.string :link_to
      t.string :alt

      t.timestamps
    end
  end
end
