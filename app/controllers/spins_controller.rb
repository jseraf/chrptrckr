class SpinsController < ApplicationController
  def index
    @pagy, @spins = pagy(Spin.with_artist_release_label.recent)
  end
end
