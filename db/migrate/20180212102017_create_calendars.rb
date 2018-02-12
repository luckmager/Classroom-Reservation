class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :classroom
      t.string :startTime
      t.string :endTime
      t.string :reservation

      t.timestamps
    end
  end
end
