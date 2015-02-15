class AddAddressIdToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.integer :address_id
    end
  end

  def self.down
    remove_attachment :orders, :address_id
  end
end
