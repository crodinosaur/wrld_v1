class AddEntryFeeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :entry_fee, :decimal
  end
end
