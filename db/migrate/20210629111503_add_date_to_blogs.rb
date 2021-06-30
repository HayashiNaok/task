class AddDateToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :date, :date
  end
end
