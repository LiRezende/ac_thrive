class AddPeopleReferenceToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :person, foreign_key: true
  end
end
