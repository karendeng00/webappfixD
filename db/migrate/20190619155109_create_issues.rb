class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.text :title
      t.text :description 
      t.text :image
      t.text :location
      t.text :user
      t.text :user_image
      t.text :date
      t.text :time

      t.timestamps
    end
  end
end
