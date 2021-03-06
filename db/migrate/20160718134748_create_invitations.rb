class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :subject
      t.text :description
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true

      t.timestamps
    end
  end
end
