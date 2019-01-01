module Spins
  class SearchController < SpinsController
    def search
      @q = Spin.with_artist_release_label.recent.ransack(params[:q])
      @pagy, @spins = pagy(@q.result)
      @spins        = SpinDecorator.decorate_collection(@spins)
      render 'spins/index'
    end
  end
end
