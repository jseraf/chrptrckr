# LastfmSearch.call('album', { artist: 'ABC', album: 'Lexicon of Love' })

class LastfmSearch
  TOKEN   = Rails.application.credentials.lastfm[:token]
  API_KEY = Rails.application.credentials.lastfm[:api_key]

  class << self
    def call(search_type:, search_hash:)
      search_hash[:limit] = 1

      wrapper = Lastfm.new(API_KEY, TOKEN)
      wrapper.send(search_type).get_info(search_hash)
    rescue Lastfm::ApiError => e # "The artist you supplied could not be found"
      return nil
    end

    private

    def album(search_hash)
      self.wrapper.album.get_info(search_hash)
    end
  end
end
