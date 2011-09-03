class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.string :name
      t.string :description
      t.integer :positive_vote, :default => 0
      t.integer :negative_vote, :default => 0
      t.integer :user_id
      t.integer :event_id
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end

