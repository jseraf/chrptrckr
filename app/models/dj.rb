class Dj < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[finders slugged]

  has_many :spins

  validates :name, presence: true, uniqueness: true

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def most_played_artist
      Artist.joins(:spins)
        .merge(Spin.by_dj(self.id))
        .group(:name)
        .count
        .sort_by { |_, count| count }
        .reverse
        .take(10)
        .to_h
  end

end
