class ChangeChosenOnAppts < ActiveRecord::Migration[5.1]
  def change
    remove_column :appts, :chosen, :string
    add_column :appts, :chosen, :boolean
  end
end
