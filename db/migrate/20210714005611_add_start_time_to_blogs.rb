class AddStartTimeToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :start_time, :datetime
  end
end
