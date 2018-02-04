class AddParentCategoryToEbisuCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :ebisu_categories, :parent_id, :integer
  end
end
