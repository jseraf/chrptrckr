require 'rails_helper'

RSpec.describe Dj, type: :model do
  it 'can instantiate a DJ' do
    dj = Dj.new
    expect(dj).to be_an_instance_of(Dj)
  end

  it 'requires a name' do
    dj = Dj.new
    expect(dj).not_to be_valid
    dj.name = 'The Midnight Crisis with John'
    expect(dj).to be_valid
  end

  it 'requires a unique name' do
    dj1 = Dj.create(name: 'John')
    dj2 = Dj.new(name: 'John')
    expect(dj2).not_to be_valid
  end

end
