class Address < ActiveRecord::Base
    
    belongs_to :user
    has_many :orders
    
	validates_presence_of :user_id, :street, :city, :pin, :title
	validates_numericality_of :user_id, :pin
	
end
