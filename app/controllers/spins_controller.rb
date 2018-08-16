class SpinsController < ApplicationController

  def index
    @pagy, @spins = pagy(Spin.with_artist_label.recent)
  end

end
