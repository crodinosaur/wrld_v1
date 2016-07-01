class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :rules
      t.text :description

      t.timestamps
    end
  end
end
