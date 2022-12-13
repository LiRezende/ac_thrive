class Teacher < ApplicationRecord
  belongs_to :person
  belongs_to :idiom
  has_many :schedules
  has_one :student

  validates :fee, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) },
                     format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
