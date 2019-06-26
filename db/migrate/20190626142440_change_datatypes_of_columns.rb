class ChangeDatatypesOfColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :issues, :title, :string
    change_column :issues, :image, :string
    change_column :issues, :user_id, :integer
  end
end
