class RemoveTermsFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :terms, :string
  end
end
