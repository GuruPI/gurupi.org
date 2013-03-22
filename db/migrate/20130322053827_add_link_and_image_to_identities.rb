class AddLinkAndImageToIdentities < ActiveRecord::Migration
  def change
  	add_column :identities, :link, :string
  	add_column :identities, :image, :string
  end
end
