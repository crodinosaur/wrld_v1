class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_one :video
  has_one :payment
end
