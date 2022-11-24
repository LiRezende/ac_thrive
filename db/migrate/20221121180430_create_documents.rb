class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :identity
      t.string :expeditor
      t.string :cpf
      t.string :nacionality
      t.string :father_name
      t.string :mother_name
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
