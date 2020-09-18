class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.date :check_in
      t.date :check_out
      t.integer :adults
      t.integer :children
      t.string :status, default: 'active'
      t.timestamps
    end
  end
end
