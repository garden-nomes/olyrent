class AddLatLngToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :latitude, :float
    add_column :rentals, :longitude, :float
  end
end
