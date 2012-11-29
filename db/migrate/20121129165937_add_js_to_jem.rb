 class AddJsToJem < ActiveRecord::Migration
  def change
    add_column :jems, :js, :string
  end
end
