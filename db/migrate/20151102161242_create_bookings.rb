class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cat, index: true, foreign_key: true
      t.integer :start_time
      t.integer :end_time
      t.integer :renting_price

      t.timestamps null: false
    end
  end
end
