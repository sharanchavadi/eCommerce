class Product < ActiveRecord::Base
	
    #associations
	belongs_to :category
	belongs_to :sub_category
	has_many :reviews
	has_many :cart_line_items
	has_many :order_products


	# built in validations
	validates_presence_of :name, :price, :category_id, :description, :stock, :sub_category_id
	validates_uniqueness_of :price, :stock
	validates_numericality_of :category_id, :sub_category_id, greater_than: 0
	validates_numericality_of :price, greater_than: 1
	validates_numericality_of :stock, greater_than_or_equal_to: 0
	validates_length_of :description, minimum: 10 #,maximum: 100
	validates_length_of :name, minimum:4
	validate :check_for_cod_based_on_price #invoke custom validation
	validate :check_for_cod_based_on_category

	#custom validations
	def check_for_cod_based_on_price
		if !self.price.nil?
			if self.price > 50000 && self.code_eligibility
				self.errors.add(:code_eligibility, "not available for products greater than 50,000")
			end
		end
	end

    def check_for_cod_based_on_category
    	if !self.category_id.nil?
    		if (self.category_id == 2 || self.category_id == 1) && self.code_eligibility
    			self.errors.add(:code_eligibility, "not availbale for products belong to Electronics and Mobile accessories")
            end
        end
    end

end
