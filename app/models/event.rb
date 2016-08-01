class Event < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :invited_users, source: :user, through: :invitations
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

  def private?
    self.privy
  end
end
