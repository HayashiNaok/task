class AddCheckToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :check, :boolean, default: false, null: false
  end
end
