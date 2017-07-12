class AddAddressToPolls < ActiveRecord::Migration[5.1]
  def change
    add_column :polls, :address, :string
    add_column :polls, :city, :string
    add_column :polls, :state, :string
  end
end
