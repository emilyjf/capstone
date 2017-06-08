class CreateAppts < ActiveRecord::Migration[5.1]
  def change
    create_table :appts do |t|
      t.string :scheduled_slot
      t.integer :poll_id

      t.timestamps
    end
  end
end
