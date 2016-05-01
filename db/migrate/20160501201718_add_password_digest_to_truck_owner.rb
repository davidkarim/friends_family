class AddPasswordDigestToTruckOwner < ActiveRecord::Migration
  def change
    add_column :truck_owners, :password_digest, :string
  end
end
