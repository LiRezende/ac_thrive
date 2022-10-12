class Person < ApplicationRecord
  belongs_to :user
  has_many :adresses
  has_many :teachers
end
