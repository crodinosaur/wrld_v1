class AddInstructionsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :instructions, :text
  end
end
