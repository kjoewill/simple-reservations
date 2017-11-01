class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.date :day
      t.string :glider
      t.string :s0800
      t.string :s0900
      t.string :s1000
      t.string :s1100
      t.string :s1200
      t.string :s1300

      t.timestamps
    end
  end
end
