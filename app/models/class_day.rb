class ClassDay < ApplicationRecord
    has_many :class_hours
    has_one :teacher
end
