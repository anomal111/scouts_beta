class AddSentAndCommissionToOrderItems < ActiveRecord::Migration
  def self.up
    change_table :order_items do |t|
      t.boolean :sent
      t.boolean :commission, :default => false
    end
  end

  def self.down
    remove_attachment :order_items, :sent
    remove_attachment :order_items, :commission
  end
end
