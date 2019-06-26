class AddNewFieldsToIssue < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :likes, :integer
    add_column :issues, :favorites, :integer
  end
end
