class AddCheckToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :check, :string
  end
end
