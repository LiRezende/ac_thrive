class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses, id: :uuid do |t|
      t.string :status_name

      t.timestamps
    end
  end
end
