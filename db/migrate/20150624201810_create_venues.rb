class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :building_name, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
