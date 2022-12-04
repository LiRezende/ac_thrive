class AddCountryToAdress < ActiveRecord::Migration[6.1]
  def change
    add_column :adresses, :country, :string
  end
end
