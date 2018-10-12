class Spin < ApplicationRecord

  belongs_to :dj, touch: true, counter_cache: true
  belongs_to :artist, touch: true, counter_cache: true
  belongs_to :release, touch: true, counter_cache: true
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
  scope :played_last_week,  -> { where("played_at > ? AND played_at < ?", Date.last_week.beginning_of_week, Date.last_week.end_of_week.end_of_week) }
  scope :played_this_month, -> { where("played_at > ?", Date.today.beginning_of_month.beginning_of_day ) }
  scope :played_last_month, -> { where("played_at > ? AND played_at < ?", Date.today.last_month.beginning_of_month.beginning_of_day, Date.today.last_month.end_of_month.end_of_day ) }
  # dj
  scope :by_dj,             -> (dj_id ) { where("dj_id = (?)", dj_id) }

  validates_uniqueness_of :chirp_id, message: 'with this chirp_id has already been saved.'
end
