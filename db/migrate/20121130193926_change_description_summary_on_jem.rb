class ChangeDescriptionSummaryOnJem < ActiveRecord::Migration
  def change
    change_column :jems, :description, :text
    change_column :jems, :summary, :text
  end
end
