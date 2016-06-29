class Read < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :read_img, :styles => { :read_index => "250x350>", :read_show => "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :read_img, :content_type => /\Aimage\/.*\Z/
end
