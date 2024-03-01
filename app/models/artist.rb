class Artist < ApplicationRecord
  extend FriendlyId

  friendly_id :name, use: %i[finders slugged]

  has_many :spins
  has_many :releases

  validates :name, presence: true, uniqueness: true

  before_save :lastfm, :discogs

  scope :alphabetical, -> { order(:name) }

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end

  def self.ransackable_associations(auth_object = nil)
    ['spin']
  end

  private

  def lastfm
    lastfm_results = LastfmSearch.call(search_type: 'artist',
                                       search_hash: { artist: name })
    return unless lastfm_results.present?

    self.lastfm_url = lastfm_results['url']

    bio = lastfm_results['bio']['content']

    # Account for the various incarnations of empty bios
    self.lastfm_bio = if bio.empty? || bio.class == Hash
                        ''
                      else
                        bio.split('<a href')&.first&.strip
                      end
  end

  def discogs
    discogs_results = DiscogsSearch.call(search_type: 'artist',
                                         search_term: name)
    return unless discogs_results.results.first.present?

    path = discogs_results.results.first.uri
    self.discogs_url = "http://discogs.com#{path}"
  end
end
