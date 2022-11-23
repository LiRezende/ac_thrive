class IdiomLevel < ApplicationRecord
  has_one :teacher
  has_one :student
end
