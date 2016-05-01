class CreateWeeklySchedules < ActiveRecord::Migration
  def change
    create_table :weekly_schedules do |t|
      t.string :week_day
      t.string :open_time
      t.string :close_time
      t.string :location

      t.timestamps null: false
    end
  end
end
