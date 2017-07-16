class RemovePollResponseIdFromResponses < ActiveRecord::Migration[5.1]
  def change
    remove_column :responses, :poll_response_id, :integer
  end
end
