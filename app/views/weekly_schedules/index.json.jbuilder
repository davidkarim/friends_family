json.array!(@weekly_schedules) do |weekly_schedule|
  json.extract! weekly_schedule, :id, :week_day, :open_time, :close_time, :location
  json.url weekly_schedule_url(weekly_schedule, format: :json)
end
