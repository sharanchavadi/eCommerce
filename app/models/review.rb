class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	validates_presence_of :product_id, :user_id, :title, :rating
	validates_numericality_of :product_id, :user_id, greater_than: 0
	validates_numericality_of :rating, within: 1..5 #inclusive range, ... is exclusive range
	validates_length_of :body, minimum: 10, allow_blank: true
end
