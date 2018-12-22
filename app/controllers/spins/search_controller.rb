module Spins
  class SearchController < SpinsController
    def search
      @q = Spin.with_artist_release_label.recent.ransack(params[:q])
      @pagy, @spins = pagy(@q.result)
      render 'spins/index'
    end
  end
end
