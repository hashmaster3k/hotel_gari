class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.integer :capacity, default: 0, null: false
      t.text :start_times, array:true, default: []
      t.string :image
    end
  end
end
