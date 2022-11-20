class Person < ApplicationRecord
  belongs_to :user
  has_one :adress
  has_one :teacher
  has_many :schedules
end
