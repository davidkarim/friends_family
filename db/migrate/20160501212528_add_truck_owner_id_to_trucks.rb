class AddTruckOwnerIdToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :truck_owner_id, :integer
  end
end
