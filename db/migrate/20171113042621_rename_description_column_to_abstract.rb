class RenameDescriptionColumnToAbstract < ActiveRecord::Migration[5.1]
  def change
  	rename_column :ebisu_articles, :description, :abstract
  end
end
