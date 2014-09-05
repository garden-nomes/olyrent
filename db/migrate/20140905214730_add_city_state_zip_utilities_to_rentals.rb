class AddCityStateZipUtilitiesToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :city, :string
    add_column :rentals, :state, :string
    add_column :rentals, :zip, :string
    add_column :rentals, :utilities, :text
  end
end
