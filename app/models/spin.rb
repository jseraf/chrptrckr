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
  scope :with_release,      -> { includes :release }
  scope :with_artist_label, -> { with_artist.with_label }
  scope :with_release_label,-> { with_release.with_label }
  scope :with_artist_release_label, -> { with_artist.with_release.with_label }

  # time-related
  scope :played_today,      -> {
    where(played_at: Time.zone.now.beginning_of_day..Time.zone.now)
  }
  scope :played_yesterday,  -> {
    starting = Time.zone.now.yesterday
    where(played_at: starting.beginning_of_day..starting.end_of_day )
  }
  scope :played_this_week,  -> {
    starting = Time.zone.now.beginning_of_week
    where(played_at: starting..starting.end_of_week )
  }
  scope :played_last_week,  -> {
    beginning = Time.zone.now.last_week
    where(played_at: beginning..beginning.end_of_week)
  }
  scope :played_this_month, -> {
    beginning = Time.zone.now.beginning_of_month
    where(played_at: Time.zone.now.beginning_of_month..beginning.end_of_month )
  }
  scope :played_last_month, -> {
    beginning = Time.zone.now.last_month.beginning_of_month
    where(played_at: beginning..beginning.end_of_month )
  }

  # dj
  scope :by_dj, -> (dj_id ) { where("dj_id = (?)", dj_id) }

  validates_uniqueness_of :chirp_id, message: 'with this chirp_id has already been saved.'
end
