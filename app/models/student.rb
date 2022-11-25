class Student < ApplicationRecord
  belongs_to :person
  belongs_to :idiom, optional: true
  belongs_to :idiom_level, optional: true
  belongs_to :teacher, optional: true
  belongs_to :company, optional: true
end
