class CreateReads < ActiveRecord::Migration[5.0]
  def change
    create_table :reads do |t|
      t.string :title
      t.text :description
      t.string :writer

      t.timestamps
    end
  end
end
