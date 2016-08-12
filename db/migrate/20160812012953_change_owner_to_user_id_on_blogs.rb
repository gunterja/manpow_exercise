class ChangeOwnerToUserIdOnBlogs < ActiveRecord::Migration
  def change
    rename_column :blogs, :owner, :user_id
  end
end
