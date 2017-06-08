class CreatePolls < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.integer :admin_id
      t.string :title
      t.string :status
      t.string :invitee
      t.string :location

      t.timestamps
    end
  end
end
