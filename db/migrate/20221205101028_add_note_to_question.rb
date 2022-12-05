class AddNoteToQuestion < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :note, :text
  end
end
