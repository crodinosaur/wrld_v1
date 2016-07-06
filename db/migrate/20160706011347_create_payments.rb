class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.belongs_to :entry, index: true

      t.timestamps
    end
  end
end
