class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :idiom
  belongs_to :class_day
  belongs_to :class_hour
end
