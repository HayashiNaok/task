class CreateCompletes < ActiveRecord::Migration[6.1]
  def change
    create_table :completes do |t|
      t.string :task
      t.date :date
      t.boolean :value
      t.integer :user_id

      t.timestamps
    end
  end
end
