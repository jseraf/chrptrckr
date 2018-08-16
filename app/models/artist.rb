class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: [:finders, :slugged]

  has_many :spins

  validates :name, presence: true, uniqueness: true

  before_save :lastfm, :discogs

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  private
    def lastfm
      lastfm_results = LastfmSearch.call('artist', { artist: self.name } )
      if lastfm_results.present?
        self.lastfm_url = lastfm_results["url"]
        self.lastfm_bio = lastfm_results["bio"]["content"]
      end
    end

    def discogs
      discogs_results = DiscogsSearch.call('artist', self.name)
      if discogs_results.results.first.present?
        self.discogs_url = "http://discogs.com#{discogs_results.results.first.uri}"
      end
    end
end
