class RemoveDeadlineFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :deadline, :datetime
  end
end
