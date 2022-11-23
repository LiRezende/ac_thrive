class Student < ApplicationRecord
  belongs_to :person
  belongs_to :idiom
  belongs_to :idiom_level
  belongs_to :teacher
  belongs_to :company, optional: true
end
