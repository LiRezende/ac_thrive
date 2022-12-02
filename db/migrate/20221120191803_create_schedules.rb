class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules, id: :uuid do |t|
      t.string :day
      t.time :hour
      t.references :person, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
