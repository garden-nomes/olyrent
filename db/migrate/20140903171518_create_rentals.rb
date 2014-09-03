class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.text :title
      t.float :price
      t.text :location
      t.float :beds
      t.float :bath
      t.text :pets
      t.text :description
      t.text :gallery
      t.text :pass_hash

      t.timestamps
    end
  end
end
