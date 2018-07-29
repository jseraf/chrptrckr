require 'rails_helper'

RSpec.describe Spin, type: :model do
  it 'can instantiate a spin' do
    spin = Spin.new
    expect(spin).to be_an_instance_of(Spin)
  end

  it 'has default attributes' do
    spin = Spin.new
    expect(spin.dj).to be_nil
    expect(spin.artist).to be_nil
    expect(spin.track).to be_nil
    expect(spin.notes).to be_nil
    expect(spin.artist_is_local).to be false
    expect(spin.label).to be_nil
    expect(spin.release).to be_nil
    expect(spin.played_at).to be_nil
    expect(spin.chirp_id).to be_nil
  end

  context 'saving a spin' do

    # this is not an real scenario
    it 'creates a valid instance when DJ and Artist associations are set' do
      dj_john = create(:dj)
      artist  = create(:artist)
      label   = create(:label)
      spin    = build(:spin, dj: dj_john, artist: artist, label: label)
      expect(spin).to be_valid
    end

  end

end
