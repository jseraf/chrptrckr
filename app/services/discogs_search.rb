class DiscogsSearch
  def self.call search_type, search_term
    token   = Rails.application.credentials.discogs[:user_token]
    wrapper = Discogs::Wrapper.new("chrptrckr", user_token: token)
    wrapper.search(search_term, per_page: 1, type: search_type)
  end
end
