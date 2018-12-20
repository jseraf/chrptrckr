class Spin < ApplicationRecord
  UNIQUE_ERROR_MESSAGE = 'with this chirp_id has already been saved.'

  belongs_to :dj, touch: true, counter_cache: true
  belongs_to :artist, touch: true, counter_cache: true
  belongs_to :release, touch: true, counter_cache: true
  belongs_to :label

  #SCOPES
  scope :recent,            -> { order( played_at: :desc ) }

  # includes
  scope :with_artist,       -> { includes :artist }
  scope :with_label,        -> { includes :label }
  scope :with_release,      -> { includes :release }
  scope :with_artist_label, -> { with_artist.with_label }
  scope :with_release_label,-> { with_release.with_label }
  scope :with_artist_release_label, -> { with_artist.with_release.with_label }

  # time-related
  scope :played_today,      -> {
    where(played_at: Time.zone.now.beginning_of_day..Time.zone.now)
  }
  scope :played_yesterday,  -> {
    start = Time.zone.now.yesterday
    where(played_at: start.beginning_of_day..start.end_of_day )
  }
  scope :played_this_week,  -> {
    start = Time.zone.now.beginning_of_week
    where(played_at: start..start.end_of_week )
  }
  scope :played_last_week,  -> {
    start = Time.zone.now.last_week
    where(played_at: start..start.end_of_week)
  }
  scope :played_this_month, -> {
    start = Time.zone.now.beginning_of_month
    where(played_at: start..start.end_of_month )
  }
  scope :played_last_month, -> {
    start = Time.zone.now.last_month.beginning_of_month
    where(played_at: start..start.end_of_month )
  }

  # dj
  scope :by_dj, -> (dj_id ) { where('dj_id = ?', dj_id) }

  ransack_alias :spin, :track_or_artist_name

  validates_uniqueness_of :chirp_id, message: UNIQUE_ERROR_MESSAGE
end
