class CreateIdioms < ActiveRecord::Migration[5.2]
  def change
    create_table :idioms do |t|
      t.string :idiom_name
      t.string :idiom_level

      t.timestamps
    end
  end
end
