class Truck < ActiveRecord::Base
  belongs_to :truck_owner
  has_many :weekly_schedules
end
