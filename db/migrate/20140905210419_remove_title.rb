class RemoveTitle < ActiveRecord::Migration
  def change
    remove_column :rentals, :title
  end
end
