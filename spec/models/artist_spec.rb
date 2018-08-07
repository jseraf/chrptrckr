require 'rails_helper.rb'

RSpec.describe Artist do
  it 'can instantiate an artist' do
    artist = Artist.new
    expect(artist).to be_an_instance_of(Artist)
  end

  it 'has default attributes' do
    artist = Artist.new
    expect(artist.name).to be_nil
    expect(artist.lastfm_url).to be_nil
    expect(artist.lastfm_bio).to be_nil
  end

  it 'requires a name' do
    artist = Artist.new
    expect(artist).not_to be_valid
    artist.name = 'Artist100'
    expect(artist).to be_valid
  end

end
