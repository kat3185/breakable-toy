class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :course_id, null: false
      t.integer :student_id, null: false
      t.string :role, null: false
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
