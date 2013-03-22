class RemoveColumnsNotUsedInUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :uid
    remove_column :users, :provider
    remove_column :users, :name
    remove_column :users, :link
  	remove_column :users, :image
  end

  def down
  	add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :name, :string
    add_column :users, :link, :string
  	add_column :users, :image, :string
  end
end
