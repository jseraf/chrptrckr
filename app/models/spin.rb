class Spin < ApplicationRecord

  belongs_to :dj, touch: true
  belongs_to :artist, touch: true
  belongs_to :label

  default_scope { includes :artist, :label }
  scope :recent, -> { order( played_at: :desc ) }

end
