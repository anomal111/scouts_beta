class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
        t.string :name
        t.string :surname
        t.string :street
        t.string :house_number
        t.integer :apartment_number
        t.string :zip_code
        t.string :city

        t.integer :shipping_id
        t.string :shipping_type
      t.timestamps
    end
  end
end
