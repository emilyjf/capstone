class AddColumnToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :invitee2, :string
    add_column :polls, :invitee3, :string
    add_column :polls, :invitee4, :string
  end
end
