class CreateUsers < ActiveRecord::Migration
  def change
    drop_table :users
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.file :image
      t.text :about
      t.string :password

      t.timestamps null: false
    end
  end
end
