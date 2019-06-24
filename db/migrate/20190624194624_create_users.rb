class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :netid
      t.text :phone
      t.text :picture

      t.timestamps
    end
  end
end
