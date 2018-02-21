class AddColumnScIdToProducts < ActiveRecord::Migration
  def change
    #add_column :table name, :column_name, :column_type
  	add_column :products, :sub_category_id, :integer

  end
end
