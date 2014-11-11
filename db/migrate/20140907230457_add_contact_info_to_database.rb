class AddContactInfoToDatabase < ActiveRecord::Migration
  def change
    add_column :rentals, :phone, :text
    add_column :rentals, :email, :text
    add_column :rentals, :email_hidden, :boolean
  end
end
