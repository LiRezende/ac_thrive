class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :idiom
  has_many :schedules
  has_one :student
end
