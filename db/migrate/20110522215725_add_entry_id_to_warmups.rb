class AddEntryIdToWarmups < ActiveRecord::Migration
  def self.up
    add_column :warmups, :entry_id, :integer
  end

  def self.down
    remove_column :warmups, :entry_id
  end
end
