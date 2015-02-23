class FixColumnName2 < ActiveRecord::Migration
  def self.up
      rename_column :addresses, :order_id, :shipping_id
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
