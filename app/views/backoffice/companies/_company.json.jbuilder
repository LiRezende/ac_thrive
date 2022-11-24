json.extract! company, :id, :name, :cnpj, :legal_representative, :phone_number, :email, :created_at, :updated_at
json.url company_url(company, format: :json)
