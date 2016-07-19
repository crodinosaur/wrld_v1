class AddPrivyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :privy, :boolean, default: false
  end
end
