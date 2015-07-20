class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :body
      t.string :time
      t.integer :venue_id

      t.timestamps
    end
  end
end
