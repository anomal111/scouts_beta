class CreateOrderPositions < ActiveRecord::Migration
  def change
    create_table :order_positions do |t|
      t.integer :ordinal
      t.integer :amount
      t.string :completed
      t.float :price
      t.references :issue

      t.timestamps
    end
  end
end
