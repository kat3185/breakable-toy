class CreateCourseReviews < ActiveRecord::Migration
  def change
    create_table :course_reviews do |t|
      t.string :name
      t.text :body, null: false
      t.integer :course_id

      t.timestamps
    end
  end
end
