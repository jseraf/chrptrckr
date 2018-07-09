require 'rails_helper.rb'

RSpec.describe Spin do
  it 'can instantiate a spin' do
    spin = Spin.new
    expect(spin).to be_an_instance_of(Spin)
  end

end
