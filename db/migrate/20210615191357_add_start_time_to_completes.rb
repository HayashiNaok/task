class AddStartTimeToCompletes < ActiveRecord::Migration[6.1]
  def change
    add_column :completes, :start_time, :datetime
  end
end
