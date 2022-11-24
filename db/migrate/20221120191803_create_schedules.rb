class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :day
      t.time :hour
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
