class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :event_date
      t.string :hour
      t.string :place
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
