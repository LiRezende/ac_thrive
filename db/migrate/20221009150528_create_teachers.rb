class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.decimal :fee
      t.references :person, foreign_key: true
      t.references :idiom, foreign_key: true

      t.timestamps
    end
  end
end
