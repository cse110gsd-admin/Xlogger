class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.string :name
      t.integer :created_by
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
