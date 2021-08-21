class SpinsController < ApplicationController
  def index
    @q            = Spin.with_artist_release_label.with_dj.recent.ransack(params[:q])
    @pagy, @spins = pagy(@q.result)
    @spins        = SpinDecorator.decorate_collection(@spins)
  end
end
