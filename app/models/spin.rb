class Spin < ApplicationRecord

  belongs_to :dj, touch: true
  belongs_to :artist, touch: true
  belongs_to :label

  #SCOPES
  scope :recent,            -> { order( played_at: :desc ) }
  # includes
  scope :with_artist,       -> { includes :artist }
  scope :with_label,        -> { includes :label }
  scope :with_artist_label, -> { with_artist.with_label }
  # time-related
  scope :played_today,      -> { where("played_at > ?", Date.today.beginning_of_day) }
  scope :played_yesterday,  -> { where("played_at > ? AND played_at < ?", Date.today.beginning_of_day - 1.day, Date.today.end_of_day - 1.day ) }
  scope :played_this_week,  -> { where("played_at > ?", Date.today.beginning_of_week.beginning_of_day ) }
  scope :played_this_month, -> { where("played_at > ?", Date.today.beginning_of_month.beginning_of_day ) }
end
