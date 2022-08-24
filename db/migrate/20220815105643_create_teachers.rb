class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.decimal :hour_fee

      t.timestamps
    end
  end
end
