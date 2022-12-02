class CreateFinancialResponsibles < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_responsibles, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :cpf
      t.references :person, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
