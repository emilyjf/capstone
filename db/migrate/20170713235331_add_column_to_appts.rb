class AddColumnToAppts < ActiveRecord::Migration[5.1]
  def change
    add_column :appts, :chosen, :string
  end
end
