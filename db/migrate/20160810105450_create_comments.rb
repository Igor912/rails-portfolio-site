class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.string :user_name
      t.string :where_we_went
      t.integer :rating
      t.string :email

      t.timestamps null: false
    end
  end
end
