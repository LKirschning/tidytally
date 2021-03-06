class HouseholdUser < ApplicationRecord
  belongs_to :user
  belongs_to :household
  validates :user, uniqueness: {scope: :household}
end
