class RenameCommentsUserIdToIdentityId < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :identity_id
  end
end
