class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.string :task
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
