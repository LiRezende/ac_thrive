class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses, id: :uuid do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :cep
      t.string :city
      t.string :state
      t.references :person, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
