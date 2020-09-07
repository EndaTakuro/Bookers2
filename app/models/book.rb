class Book < ApplicationRecord

	belongs_to :user
	attachment :image

	with_options presence: true do
		validates :title , presence: true
		validates :body , presence: true ,length: { maximum:200 }
	end
end
