class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.date :birthdate
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
