class FixColumnName3 < ActiveRecord::Migration
  def self.up
      rename_column :orders, :order_status_id, :status
    end

    def self.down
      # rename back if you need or do something else or do nothing
    end
end
