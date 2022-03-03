class Household < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :household_users
  has_many :users, through: :household_users
end
