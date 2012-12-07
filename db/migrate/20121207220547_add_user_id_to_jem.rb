class AddUserIdToJem < ActiveRecord::Migration
  def change
    add_column :jems, :user_id, :integer
  end
end
