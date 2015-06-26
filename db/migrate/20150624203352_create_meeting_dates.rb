class CreateMeetingDates < ActiveRecord::Migration
  def change
    create_table :meeting_dates do |t|
      t.date :first, null: false
      t.date :second
      t.date :third
      t.date :fourth

      t.timestamps
    end
  end
end
