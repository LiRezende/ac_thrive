class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :motivation
      t.text :hobby
      t.text :country
      t.text :culture
      t.text :work
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
