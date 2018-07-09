require 'rails_helper.rb'

RSpec.describe Dj do
  it 'can instantiate a DJ' do
    dj = Dj.new
    expect(dj).to be_an_instance_of(Dj)
  end
end
