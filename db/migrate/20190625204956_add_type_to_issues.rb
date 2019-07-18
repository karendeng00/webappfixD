class AddTypeToIssues < ActiveRecord::Migration[5.2]
  def change
    add_column :issues, :type, :string
  end
end
