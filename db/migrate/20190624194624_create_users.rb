class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :netid
      t.string :phone
      t.string :picture

      t.timestamps
    end
  end
end
