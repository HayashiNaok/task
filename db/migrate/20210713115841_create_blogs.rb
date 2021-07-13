class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.date :date
      t.string :content
      t.string :check
      t.integer :user_id

      t.timestamps
    end
  end
end
