class ChangeCustomUrlToSlugOnBlog < ActiveRecord::Migration
  def change
    remove_column :blogs, :custom_url
    add_column :blogs, :slug, :string, unique: true
    add_index :blogs, :slug, unique: true
  end
end
