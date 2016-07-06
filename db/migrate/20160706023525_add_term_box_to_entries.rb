class AddTermBoxToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :terms, :string
  end
end
