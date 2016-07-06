class RemoveZipCodeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :zip_code, :integer
  end
end
