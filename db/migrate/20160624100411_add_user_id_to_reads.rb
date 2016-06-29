class AddUserIdToReads < ActiveRecord::Migration[5.0]
  def change
    add_column :reads, :user_id, :integer
  end
end
