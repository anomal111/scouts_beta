class AddActiveToIssues < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.boolean :active
    end
  end

  def self.down
    remove_attachment :issues, :active
  end
end
