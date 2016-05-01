class ChangeTimeColumnsInWeeklySchedule < ActiveRecord::Migration
  def change
    remove_column :weekly_schedules, :open_time
    remove_column :weekly_schedules, :close_time
    add_column :weekly_schedules, :open_time, :time
    add_column :weekly_schedules, :close_time, :time
  end
end
