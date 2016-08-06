class AddOwnerToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :owner, :integer
    add_foreign_key :blogs, :users, column: :owner, on_delete: :cascade
  end
end
