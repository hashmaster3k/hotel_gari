class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :beds
      t.float :price
      t.boolean :river_view, default: false, null: false
      t.boolean :is_rented, default: false, null: false
      t.integer :renter_id
    end
  end
end
