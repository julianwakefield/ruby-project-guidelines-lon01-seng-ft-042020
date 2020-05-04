class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.integer :no_of_rooms
      t.string :self_catered
      t.string :wi_fi
      t.integer :price_per_night
    end
  end
end
