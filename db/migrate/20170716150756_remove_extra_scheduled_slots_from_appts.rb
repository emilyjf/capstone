class RemoveExtraScheduledSlotsFromAppts < ActiveRecord::Migration[5.1]
  def change
    remove_column :appts, :scheduled_slot2, :string
    remove_column :appts, :scheduled_slot3, :string
    remove_column :appts, :scheduled_slot4, :string

    remove_column :appts, :scheduled_slot, :string
    add_column :appts, :scheduled_slot, :datetime
  end
end
