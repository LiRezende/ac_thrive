class Teacher < ApplicationRecord
    belongs_to :person, optional: true
end
