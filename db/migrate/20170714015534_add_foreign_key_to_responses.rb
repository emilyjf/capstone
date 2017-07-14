class AddForeignKeyToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :poll_response_id, :integer
  end
end
