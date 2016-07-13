class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :video
  has_one :payment

  validates :event_id, presence: true
end
