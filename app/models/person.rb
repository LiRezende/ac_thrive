class Person < ApplicationRecord
  belongs_to :user
  has_one :adress, :dependent => :destroy
  has_one :teacher, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  has_one :document, :dependent => :destroy
  has_one :student, :dependent => :destroy
  has_one :financial_responsible, :dependent => :destroy
  has_one :question, :dependent => :destroy
end
