class Release < ApplicationRecord
  has_many :spins

  # artist_id
  # year
  # discogs id
  # discogs url
  # last_fm wiki
  # last_fm url ?
  # spins_counter


  # private
  #   def lastfm
  #     lastfm_results = LastfmSearch.call(
  #                         search_type: 'album',
  #                         search_hash: #{ artist: self.name }
  #                       )
  #     if lastfm_results.present?
 #       self.lastfm_url = lastfm_results["url"]
 #       self.lastfm_bio = lastfm_results["bio"]["content"]
    #   end
    # end

    # def discogs
    #   discogs_results = DiscogsSearch.call(
    #                       search_type: 'master',
    #                       search_term: # (aritst, release, song).join(' - ')self.name
    #                     )
    #   if discogs_results.results.first.present?
#        self.discogs_url = "http://discogs.com#{discogs_results.results.first.uri}"
    #   end
    # end



end
