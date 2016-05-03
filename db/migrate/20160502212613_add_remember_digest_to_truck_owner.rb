class AddRememberDigestToTruckOwner < ActiveRecord::Migration
  def change
    add_column :truck_owners, :remember_digest, :string
  end
end
