class Artist < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:finders, :slugged]

  has_many :spins

  validates :name, presence: true, uniqueness: true

  after_create :lastfm

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  private
    def lastfm
      search_results = LastfmSearch.call('artist', { artist: self.name } )
      if search_results.any?
        self.lastfm_url = search_results["url"]
        self.lastfm_bio = search_results["bio"]["content"] #unless strip_links(content).strip.eql? 'Read more on Last.fm'
        self.save
      end
    end
end
