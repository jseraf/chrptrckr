class SpinsController < ApplicationController

  def index
    @pagy, @spins = pagy(Spin.recent)
  end
end
