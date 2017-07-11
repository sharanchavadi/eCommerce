class AddColumnAddressIdToOrders < ActiveRecord::Migration

  def change

    #add_column :table name, :column_name, :column_type
  	add_column :orders, :address_id, :integer

  end

end
