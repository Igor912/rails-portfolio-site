class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone_number
      t.string :trip_from
      t.string :trip_to
      t.datetime :date_of_departure
      t.text :notes

      t.timestamps null: false
    end
  end
end
