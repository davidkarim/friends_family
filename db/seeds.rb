# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
truck_owner_list = [
  ["Joe", "joe@email.com","foobar"],
  ["Jimbo", "jimbo@jimbo.com","foobar"],
  ["Jose", "jose@jose.com","foobar"]
]

truck_list = [
  ["Tin Star Truck", "www.tinstar.com", "954-224-3598", false, 1, "https://s3.amazonaws.com/food-trucks/truck1.jpg"],
  ["Namaste Cafe", "www.namaste.com", "954-225-5555", false, 1, "https://s3.amazonaws.com/food-trucks/truck2.jpg"],
  ["Go Fish", "www.gofish.com", "954-227-6000", false, 2, "https://s3.amazonaws.com/food-trucks/truck3.jpg"],
  ["The Awesome Truck", "www.awesometruck.com", "954-228-7777", false, 3, ""]
]

schedule = [
  ["Monday", "12356 Rockledge Cir, Boca Raton, FL 33428", 1, "09:00:00", "13:00:00"],
  ["Tuesday", "525 Northwest 1st Ave, Fort Lauderdale, FL", 1, "09:30:00", "13:30:00"],
  ["Wednesday", "1111 Parrot Jungle Trail, Miami", 1, "09:30:00", "15:00:00"],
  ["Monday", "621 NW 53rd Street, Miami, FL", 2, "09:00:00", "13:00:00"],
  ["Tuesday", "1235 East Las Olas Blvd, Fort Lauderdale, FL", 2, "09:30:00", "13:30:00"],
  ["Wednesday", "1200 East Las Olas Blvd, Fort Lauderdale, FL", 3, "11:30:00", "15:00:00"],
  ["Friday", "1000 East Las Olas Blvd, Fort Lauderdale, FL", 4, "9:30:00", "15:00:00"]
]

truck_owner_list.each do |name, email, password|
  TruckOwner.create(name: name, email: email, password: password)
end

truck_list.each do |name, web_url, phone_number, claimed, truck_owner_id, image_url|
  Truck.create(name: name, web_url: web_url, phone_number: phone_number, claimed: claimed, truck_owner_id: truck_owner_id, image_url: image_url)
end

schedule.each do |week_day, location, truck_id, open_time, close_time |
  WeeklySchedule.create(week_day: week_day, location: location, truck_id: truck_id, open_time: open_time, close_time: close_time)
end
