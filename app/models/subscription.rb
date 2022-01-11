class Subscription < ApplicationRecord
  has_many :memberships
  has_many :customers, through: :memberships
  has_many :teas, through: :memberships

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true

  enum frequency: { 'Weekly' => 0, 'Bi-Weekly' => 1, 'Monthly' => 2 }
end
