class AddEntryIdToWorkouts < ActiveRecord::Migration
  def self.up
    add_column :workouts, :entry_id, :integer
  end

  def self.down
    remove_column :workouts, :entry_id
  end
end
