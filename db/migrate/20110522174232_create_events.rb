class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.date :date
      t.text :body
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
