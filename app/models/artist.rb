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
    return if lastfm_url.present? && lastfm_bio.present?

    lastfm_results = LastfmSearch.call(search_type: 'artist',
                                       search_hash: { artist: name })
    return unless lastfm_results.present?

    self.lastfm_url = lastfm_results['url']

    bio = lastfm_results['bio']['content']

    # Account for the various incarnations of empty bios
    self.lastfm_bio = if bio.empty? || bio.instance_of?(Hash)
                        ''
                      else
                        bio.split('<a href')&.first&.strip
                      end
  end

  def discogs
    return if discogs_url.present?

    discogs = discogs_results
    return unless discogs.present? # && discogs_results.results.first.present?

    self.discogs_url = "http://discogs.com#{discogs.uri}"
  end

  def discogs_results
    DiscogsSearch.call(search_type: 'artist', search_term: name)&.results&.first
  end
end
