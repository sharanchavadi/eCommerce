class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :category_id
      t.integer :stock
      t.boolean :code_eligibility
      t.string :image_url
      t.timestamps null: false
      #arguments for methods we use colon before, options for the method we use colon after
    end
  end
end
