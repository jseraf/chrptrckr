class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[finders slugged]

  has_many :spins

  validates :name, presence: true, uniqueness: true

  before_save :lastfm, :discogs

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  private

  def lastfm
    lastfm_results = LastfmSearch.call(
                                    search_type: 'artist',
                                    search_hash: { artist: name }
                                  )
    return unless lastfm_results.present?

    self.lastfm_url = lastfm_results['url']
    self.lastfm_bio = lastfm_results['bio']['content']
  end

  def discogs
    discogs_results = DiscogsSearch.call(
                        search_type: 'artist',
                        search_term: name
                      )
    return unless discogs_results.results.first.present?

    path = discogs_results.results.first.uri
    self.discogs_url = "http://discogs.com#{path}"
  end
end
