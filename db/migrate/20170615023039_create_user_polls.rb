class CreateUserPolls < ActiveRecord::Migration[5.1]
  def change
    create_table :user_polls do |t|
      t.integer :user_id
      t.integer :poll_id

      t.timestamps
    end
  end
end
