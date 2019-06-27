class AddNameToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :name, :string
  end
end
