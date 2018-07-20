require 'rails_helper.rb'

RSpec.describe Lastfm do
  it 'sets params' do
    search_params = {artist: 'ABC'}
    search_type   = 'artist'
    query         = LastfmSearch.new(search_params, search_type)
  end
end
