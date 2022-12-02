class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.string :cnpj
      t.string :legal_representative
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
