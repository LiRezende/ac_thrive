class Person < ApplicationRecord
  belongs_to :user
  has_one :adress
  has_one :teacher
  has_many :schedules
  has_one :document
  has_one :student
  has_one :financial_responsible
  has_one :question
end
