class CreateIdiomLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :idiom_levels, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
