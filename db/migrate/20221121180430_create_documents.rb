class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents, id: :uuid do |t|
      t.string :identity
      t.string :expeditor
      t.string :cpf
      t.string :nacionality
      t.string :father_name
      t.string :mother_name
      t.references :person, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
