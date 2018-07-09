require 'rails_helper.rb'

RSpec.describe Artist do
  it 'can instantiate an artist' do
    artist = Artist.new
    expect(artist).to be_an_instance_of(Artist)
  end
end
