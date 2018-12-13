class Dj < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[finders slugged]

  has_many :spins

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  SPIN_COUNT_SCOPES = %w[this_month last_month].freeze

  def most_played_by_dj
    most_played = {}
    most_played[:last_month] = most_played_artist_last_month
    most_played[:this_month] = most_played_artist_this_month
  end

  SPIN_COUNT_SCOPES.each do |time_frame|
    define_method "most_played_artist_#{time_frame}" do |argument = nil|
      Artist.joins(:spins)
            .merge(Spin.send("played_#{time_frame}"))
            .merge(Spin.by_dj(id))
            .group(:name)
            .count
            .sort_by { |_, count| count }
            .reverse
            .take(10)
            .to_h
    end
  end

end
