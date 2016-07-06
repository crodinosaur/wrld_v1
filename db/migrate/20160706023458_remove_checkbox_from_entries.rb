class RemoveCheckboxFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :checkbox, :boolean
  end
end
