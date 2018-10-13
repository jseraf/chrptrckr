class DiscogsSearch

  TOKEN = Rails.application.credentials.discogs[:user_token]
  def self.call(search_type:, search_term:)
    wrapper = Discogs::Wrapper.new("chrptrckr", user_token: TOKEN)
    wrapper.search(search_term, per_page: 1, type: search_type)
  end

  def self.get_search_fields search_type
    case search_type
    when 'release'
      ['artist', 'release', 'track']
    end
  end
end
