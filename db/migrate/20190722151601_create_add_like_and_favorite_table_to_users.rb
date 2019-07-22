class CreateAddLikeAndFavoriteTableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :likedIssues, :integer, array: true, default: []
    add_column :users, :favoritedIssues, :integer, array: true, default: []
  end
end