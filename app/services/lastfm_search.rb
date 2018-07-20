# 2.5.0 :001 > LastfmSearch.call('album',{artist: 'ABC',album:'Lexicon of Love'})
# Traceback (most recent call last):
#         3: from (irb):1
#         2: from app/services/lastfm_search.rb:12:in `call'
#         1: from app/services/lastfm_search.rb:20:in `album'

class LastfmSearch

  attr_accessor :search_params, :search_type, :wrapper

  def self.call search_type, search_hash
    token   = Rails.application.credentials.lastfm[:token]
    api_key = Rails.application.credentials.lastfm[:api_key]

    wrapper = Lastfm.new(api_key, token)

    case search_type
    when 'album'
      album (search_hash)
    else
      return_nil
    end
  end

  private
  def self.album search_hash
    self.wrapper.album.get_info(search_hash)
  end

  def return_nil
    nil
  end
end
