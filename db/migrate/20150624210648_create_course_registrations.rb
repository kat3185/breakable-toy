class CreateCourseRegistrations < ActiveRecord::Migration
  def change
    create_table :course_registrations do |t|
      t.integer :course_id, null: false
      t.integer :student_id, null: false
      t.string :role, null: false, default: "None"
      t.boolean :paid, default: false

      t.timestamps
    end
  end
end
