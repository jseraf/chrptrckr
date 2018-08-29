require 'rails_helper.rb'

RSpec.describe Lastfm do
  it 'sets params' do
    search_params = { artist: 'ABC' }
    search_type   = 'artist'
    query         = LastfmSearch.call(
                                      search_type: search_type,
                                      search_hash: search_params
                                      )
  end
end
