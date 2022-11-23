class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :occupation
      t.string :position
      t.boolean :financial_responsible
      t.references :person, foreign_key: true
      t.references :idiom, foreign_key: true
      t.references :idiom_level, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
