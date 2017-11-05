class CreateEbisuBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_bodies do |t|
      t.integer :paragraph_id
      t.text :content

      t.timestamps
    end
  end
end
