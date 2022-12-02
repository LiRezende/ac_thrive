class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers, id: :uuid do |t|
      t.decimal :fee
      t.references :person, foreign_key: true, type: :uuid
      t.references :idiom, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
