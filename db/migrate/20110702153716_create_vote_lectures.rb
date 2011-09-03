class CreateVoteLectures < ActiveRecord::Migration
  def self.up
    create_table :vote_lectures do |t|
      t.integer :lecture_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vote_lectures
  end
end
