class Idiom < ApplicationRecord
    has_many :idiom_levels
    has_many :teachers
end
