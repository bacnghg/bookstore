class AddReadIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :read_id, :integer
  end
end
