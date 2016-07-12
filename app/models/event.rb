class Event < ActiveRecord::Base
  has_many :entries
  belongs_to :creator, class_name: 'User'
  has_many :users, through: :entries
  has_many :videos, through: :entries
  has_many :payments, through: :entries

  validates :name, presence: true
  # def expired?
  # 	self.deadline < DateTime.now
  # end

  # def self.expired
  # 	Event.where("deadline < ?", DateTime.now)
  # end
end
