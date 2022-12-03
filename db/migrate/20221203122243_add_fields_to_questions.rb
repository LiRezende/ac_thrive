class AddFieldsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :course, :string
    add_column :questions, :period, :string
    add_column :questions, :end_period, :string
    add_column :questions, :level, :string
  end
end
