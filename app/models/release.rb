class Release < ApplicationRecord
  belongs_to :artist
  has_many :spins
end
