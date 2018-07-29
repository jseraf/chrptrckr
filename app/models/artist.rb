class Artist < ApplicationRecord
  has_many :spins

  validates :name, presence: true, uniqueness: true

end
