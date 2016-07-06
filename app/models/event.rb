class Event < ActiveRecord::Base
  has_many :entries
  belongs_to :creator, class_name: 'User'
  has_many :users, through: :entries
  has_many :videos, through: :entries
  has_many :payments, through: :entries
end
