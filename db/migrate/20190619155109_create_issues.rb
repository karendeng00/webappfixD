class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description 
      t.string :image
      t.text :location
      t.s :user_id
      
      t.timestamps 
    end
  end
end
