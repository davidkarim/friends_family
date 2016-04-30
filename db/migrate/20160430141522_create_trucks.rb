class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.string :web_url
      t.string :phone_number
      t.boolean :claimed

      t.timestamps null: false
    end
  end
end
