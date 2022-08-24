class Person < ApplicationRecord
    belongs_to :user
    
    has_one :teacher
    accepts_nested_attributes_for :teacher
end
