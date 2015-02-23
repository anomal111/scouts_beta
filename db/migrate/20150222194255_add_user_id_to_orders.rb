class AddUserIdToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.integer :user_id
    end
  end

  def self.down
    remove_attachment :orders, :user_id
  end
end
