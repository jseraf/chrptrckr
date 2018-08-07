# 2.5.0 :001 > LastfmSearch.call('album',{artist: 'ABC',album:'Lexicon of Love'})
# Traceback (most recent call last):
#         3: from (irb):1
#         2: from app/services/lastfm_search.rb:12:in `call'
#         1: from app/services/lastfm_search.rb:20:in `album'

class LastfmSearch
  # artist only for now


  def self.call search_type, search_hash
    token       = Rails.application.credentials.lastfm[:token]
    api_key     = Rails.application.credentials.lastfm[:api_key]
    search_hash[:limit] = 1

    wrapper     = Lastfm.new(api_key, token)
    wrapper.send(search_type).get_info(search_hash)
  end

  private
  def self.album search_hash
    self.wrapper.album.get_info(search_hash)
  end

  def return_nil
    nil
  end
end
