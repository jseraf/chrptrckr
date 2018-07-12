class Dj < ApplicationRecord
  validates :name, presence: true, uniqueness: true

end
