class AddCountryCodeToPerson < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :country_code, :string
  end
end
