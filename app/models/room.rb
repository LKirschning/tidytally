class Room < ApplicationRecord
  belongs_to :household
  has_many :tasks

end
