class CreateRegistrationHolder < ActiveRecord::Migration
  def change
    create_table :registration_holders do |t|
      t.string :first_role
      t.string :second_role
      t.string :third_role
      t.string :fourth_role
      t.string :fifth_role
      t.string :sixth_role
      t.integer :first_course
      t.integer :second_course
      t.integer :third_course
      t.integer :fourth_course
      t.integer :fifth_course
      t.integer :sixth_course
      t.integer :student_id
      t.integer :month

      t.timestamps
    end
  end
end
