class AddTypeToEbisuCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :ebisu_categories, :type, :string
  end
end
