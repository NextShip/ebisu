class CreateEbisuFigures < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_figures do |t|
      t.integer :paragraph_id
      t.string :content_uid

      t.timestamps
    end
  end
end
