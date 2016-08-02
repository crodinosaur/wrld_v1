class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :video
  accepts_nested_attributes_for :video
  has_one :payment

  validates :event_id, presence: true
  validates :video, presence: true

  validates_acceptance_of :tos, allow_nil: false
end
