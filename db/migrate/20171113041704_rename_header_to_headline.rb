class RenameHeaderToHeadline < ActiveRecord::Migration[5.1]
  def change
  	rename_table :ebisu_headers, :ebisu_headlines
  end
end
