class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :image
      t.text :about

      t.timestamps null: false
    end
  end
end
