class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :provider
      t.string  :uid
      t.string  :name
      t.string  :email
      t.string  :image
      t.string  :link
      t.string  :gender
      t.integer :timezone

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
