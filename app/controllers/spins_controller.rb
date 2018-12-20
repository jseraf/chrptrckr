class SpinsController < ApplicationController
  def index
    @q = Spin.with_artist_release_label.recent.ransack(params[:q])
    @pagy, @spins = pagy(@q.result)
  end
end
