class AddColumnsToAppts < ActiveRecord::Migration[5.1]
  def change
    add_column :appts, :scheduled_slot2, :string
    add_column :appts, :scheduled_slot3, :string
    add_column :appts, :scheduled_slot4, :string
  end
end
