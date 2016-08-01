class AddBetToEvent < ActiveRecord::Migration
  def change
    add_column :events, :bet, :decimal
  end
end
