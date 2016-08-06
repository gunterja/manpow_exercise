class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blog_name
      t.string :custom_url

      t.timestamps null: false
    end
  end
end
