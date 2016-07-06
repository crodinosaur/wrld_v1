class AddStatePictureBioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :bio, :text
    add_column :users, :picture, :string
  end
end
