class Person < ApplicationRecord
  belongs_to :user
  has_many :adresses
end