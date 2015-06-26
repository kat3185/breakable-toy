class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :full_name, null: false
      t.text :bio, null: false
      t.string :email, null: false
      t.string :photo_url
      t.string :video_url

      t.timestamps
    end
  end
end
