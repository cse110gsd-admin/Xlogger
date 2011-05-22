class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.string :name
      t.text :body
      t.references :event

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
