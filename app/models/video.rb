class Video < ActiveRecord::Base
  belongs_to :entry
  has_one :event, through: :entry
  has_one :user, through: :entry
end
