class AddColumnToResponses < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :answer, :string
  end
end
