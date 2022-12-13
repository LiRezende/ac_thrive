class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, id: :uuid do |t|
      t.decimal :fee, precision: 5, scale: 2
      t.references :person, foreign_key: true, type: :uuid
      t.references :idiom, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
