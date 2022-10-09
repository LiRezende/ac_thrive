class CreateClassHours < ActiveRecord::Migration[5.2]
  def change
    create_table :class_hours do |t|
      t.time :description
      t.references :class_day, foreign_key: true

      t.timestamps
    end
  end
end
