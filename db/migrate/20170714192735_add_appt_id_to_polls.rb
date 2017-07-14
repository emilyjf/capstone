class AddApptIdToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :appt_id, :integer
  end
end
