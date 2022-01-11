class Customer < ApplicationRecord
  has_many :memberships
  has_many :teas, through: :memberships
  has_many :subscriptions, through: :memberships
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_presence_of :address
end
