class ClassHour < ApplicationRecord
  belongs_to :class_day
  has_one :teacher
end
