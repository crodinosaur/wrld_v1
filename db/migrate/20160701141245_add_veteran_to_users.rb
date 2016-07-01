class AddVeteranToUsers < ActiveRecord::Migration
  def change
    add_column :users, :veteran, :boolean
  end
end
