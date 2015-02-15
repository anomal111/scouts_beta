class FixColumnName < ActiveRecord::Migration
  def self.up
      rename_column :addresses, :shipping_id, :order_id
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
