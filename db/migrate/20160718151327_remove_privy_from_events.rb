class RemovePrivyFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :privy, :boolean
  end
end
