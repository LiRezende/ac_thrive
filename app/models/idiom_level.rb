class IdiomLevel < ApplicationRecord
  belongs_to :idiom
  has_one :teacher
end
