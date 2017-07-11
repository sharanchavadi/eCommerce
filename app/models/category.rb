class Category < ActiveRecord::Base

    #associations
	has_many :products
	has_many :sub_categories

    #validations
	validates_presence_of :name

end
