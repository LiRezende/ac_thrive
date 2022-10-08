class CreateIdiomLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :idiom_levels do |t|
      t.string :name
      t.references :idiom, foreign_key: true

      t.timestamps
    end
  end
end
