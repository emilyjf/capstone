class RemoveApptIdFromPolls < ActiveRecord::Migration[5.1]
  def change
    remove_column :polls, :appt_id, :integer
  end
end
