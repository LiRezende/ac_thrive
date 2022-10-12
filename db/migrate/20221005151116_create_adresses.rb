class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string :street
      t.integer :number
      t.string :complement
      t.string :neighborhood
      t.string :cep
      t.string :city
      t.string :state
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
