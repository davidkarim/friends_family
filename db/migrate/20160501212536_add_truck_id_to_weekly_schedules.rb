class AddTruckIdToWeeklySchedules < ActiveRecord::Migration
  def change
    add_column :weekly_schedules, :truck_id, :integer
  end
end
