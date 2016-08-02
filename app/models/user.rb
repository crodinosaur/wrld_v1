class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_many :entries
  has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :invitations
  has_many :invited_events, source: :event, through: :invitations
  has_many :events, through: :entries
  has_many :videos, through: :entries
  has_many :payments, through: :entries

  acts_as_followable
  acts_as_follower

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def invited?(event)
    self.invited_events.include?(event)
  end

  def ranking(event, entry)
    if event.users.include? self
      @entries = event.entries.order(score: :desc)
      puts "@entries are #{@entries.inspect}\n"
      @entry = entry
      puts "@entry is #{@entry.inspect}\n"
      @ranking = @entries.find_index(@entry)
      puts "@ranking is #{@ranking}"
      return @ranking + 1
    else
      return nil
    end
  end

end
