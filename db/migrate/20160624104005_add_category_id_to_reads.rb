class AddCategoryIdToReads < ActiveRecord::Migration[5.0]
  def change
    add_column :reads, :category_id, :integer
  end
end
