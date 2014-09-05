class ChangePassDigestName < ActiveRecord::Migration
  def change
    rename_column :rentals, :pass_hash, :password_digest
  end
end
