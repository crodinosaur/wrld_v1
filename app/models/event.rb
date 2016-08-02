class Event < ActiveRecord::Base
  has_many :entries, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :invited_users, source: :user, through: :invitations
  has_many :users, through: :entries
  has_many :videos, through: :entries
  has_many :payments, through: :entries

# VALIDATIONS -->

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rules, presence: true
  validates :instructions, presence: true
  validates :deadline, presence: true
  validates :bet, numericality: true


  before_create :handle_bets

  after_find do
    self.expired = 1 if self.deadline < DateTime.now
  end

  

  # validate :bet_is_greater_than_5


  # def bet_is_greater_than_5
  #   if bet
  #     if bet > 5
  #       # all good. do nothing
  #     else
  #       self.errors.add(:bet, "Sorry.  You must have a minimum bet of 5")
  #     end
  #   end
  # end

  def handle_bets
      self.bet = nil unless self.private?
  end

  # def self.expired
  # 	Event.where("deadline < ?", DateTime.now)
  # end

  def private?
    self.privy
  end
end
