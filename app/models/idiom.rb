class Idiom < ApplicationRecord
    has_many :teachers
    has_one :student
end
