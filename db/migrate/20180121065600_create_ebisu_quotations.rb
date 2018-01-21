class CreateEbisuQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :ebisu_quotations do |t|
      t.integer :paragraph_id
      t.string :content

      t.timestamps
    end
  end
end
