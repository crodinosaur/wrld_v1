class AddScoreCheckboxToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :score, :integer
    add_column :entries, :checkbox, :boolean
  end
end
