class AddAuthorEmailDescriptionSummaryHomepageToJem < ActiveRecord::Migration
  def change
    add_column :jems, :author, :string
    add_column :jems, :email, :string
    add_column :jems, :summary, :string
    add_column :jems, :homepage, :string
  end
end
