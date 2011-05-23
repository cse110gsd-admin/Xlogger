class AddWarmupIdToExercises < ActiveRecord::Migration
  def self.up
    add_column :exercises, :warmup_id, :integer
  end

  def self.down
    remove_column :exercises, :warmup_id
  end
end
