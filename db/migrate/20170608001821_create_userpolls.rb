class CreateUserpolls < ActiveRecord::Migration[5.1]
  def change
    create_table :userpolls do |t|
      t.integer :user_id
      t.integer :poll_id

      t.timestamps
    end
  end
end
