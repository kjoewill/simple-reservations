class AddFieldsToSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :s0830, :string
    add_column :schedules, :s0930, :string
    add_column :schedules, :s1030, :string
    add_column :schedules, :s1130, :string
    add_column :schedules, :s1230, :string
    add_column :schedules, :s1330, :string
    add_column :schedules, :s1400, :string
    add_column :schedules, :s1430, :string
    add_column :schedules, :s1500, :string
    add_column :schedules, :s1530, :string
    add_column :schedules, :s1600, :string
    add_column :schedules, :s1630, :string
  end
end
