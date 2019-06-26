class EditIssuesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :issues, :user_id, :integer
    add_reference :issues, :user, index: true, foreign_key: true
  end
end
