class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :alt_phone, :string
    add_column :users, :email, :string
  end
end
