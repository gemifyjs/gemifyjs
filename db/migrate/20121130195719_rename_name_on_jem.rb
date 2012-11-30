class RenameNameOnJem < ActiveRecord::Migration
  def change 
    rename_column :jems, :name, :base_name
  end
end
