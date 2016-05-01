# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
truck_owner_list = [
  ["Joe", "joe@email.com"],
  ["Jimbo", "jimbo@jimbo.com"],
  ["Jose", "jose@jose.com"]
]

truck_list = [
  ["First Truck", "www.firsttruck.com", "954-224-3598", false, 1],
  ["Second Truck", "www.secondtruck.com", "954-225-5555", false, 1],
  ["Third Truck", "www.thirdtruck.com", "954-226-6666", false, 2],
  ["Fourth Truck", "www.fourthtruck.com", "954-228-7777", false, 3]
]

schedule = [
  ["Monday", "Location 1", 1, "09:00:00", "13:00:00"],
  ["Tuesday", "Location 2", 1, "09:30:00", "13:30:00"],
  ["Wednesday", "Location 3", 1, "09:30:00", "15:00:00"],
  ["Monday", "Location A", 2, "09:00:00", "13:00:00"],
  ["Tuesday", "Location B", 2, "09:30:00", "13:30:00"],
  ["Wednesday", "Location C", 3, "09:30:00", "15:00:00"]
]

truck_owner_list.each do |name, email|
  TruckOwner.create(name: name, email: email)
end

truck_list.each do |name, web_url, phone_number, claimed, truck_owner_id|
  Truck.create(name: name, web_url: web_url, claimed: claimed, truck_owner_id: truck_owner_id)
end

schedule.each do |week_day, location, truck_id, open_time, close_time |
  WeeklySchedule.create(week_day: week_day, location: location, truck_id: truck_id, open_time: open_time, close_time: close_time)
end
