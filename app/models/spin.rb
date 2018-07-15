class Spin < ApplicationRecord

  belongs_to :dj, touch: true
  belongs_to :artist, touch: true

end
