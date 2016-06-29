class AddAttachmentReadImgToReads < ActiveRecord::Migration
  def self.up
    change_table :reads do |t|
      t.attachment :read_img
    end
  end

  def self.down
    remove_attachment :reads, :read_img
  end
end
