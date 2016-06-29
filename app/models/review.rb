class Review < ApplicationRecord
	belongs_to :read
	belongs_to :user
end
