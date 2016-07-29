class AddTermsToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :terms, :boolean
  end
end
