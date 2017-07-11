class AddColumnCodeToProductsAndCategories < ActiveRecord::Migration
  def change

  	#add_column :table name, :column_name, :column_type
  	add_column :products, :code, :string

  	add_column :categories, :code, :string

  end
end
