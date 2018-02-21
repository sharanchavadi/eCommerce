class OrderProduct < ActiveRecord::Base

    belongs_to :product
    belongs_to :order

	validates_presence_of :order_id, :product_id, :quantity, :price, :total
	validates_numericality_of :order_id, :product_id, :quantity, :price, :total, greater_than: 0
end
