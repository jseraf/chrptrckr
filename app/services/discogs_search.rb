class DiscogsSearch
  def self.call search_term, search_type
    token   = Rails.application.credentials.discogs[:user_token]
    wrapper = Discogs::Wrapper.new("chrptrckr", user_token: token)

    wrapper.search(search_term, per_page: 1, type: search_type.to_sym).results
  end
end
