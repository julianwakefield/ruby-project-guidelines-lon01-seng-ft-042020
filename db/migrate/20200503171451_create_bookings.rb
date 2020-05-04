class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :user_id
      t.string :property_id
      t.integer :price
      t.string :payment_status
    end
  end
end
