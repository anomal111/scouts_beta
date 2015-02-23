class AddPaymentsToOrders < ActiveRecord::Migration
  def self.up
    change_table :orders do |t|
      t.date :payment
    end
  end

  def self.down
    remove_attachment :orders, :payment
  end
end
