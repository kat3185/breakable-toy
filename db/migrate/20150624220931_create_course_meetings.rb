class CreateCourseMeetings < ActiveRecord::Migration
  def change
    create_table :course_meetings do |t|
      t.integer :course_id, null: false
      t.integer :meeting_date_id, null: false

      t.timestamps
    end
  end
end
