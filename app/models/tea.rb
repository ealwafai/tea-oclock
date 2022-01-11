class Tea < ApplicationRecord
  has_many :memberships
  has_many :customers, through: :memberships
  has_many :subscriptions, through: :memberships

  validates :title, presence: true, uniqueness: true
  validates_presence_of :description
  validates :temperature, numericality: true
  validates :brew_time, numericality: true
end
