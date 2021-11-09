class SpinsController < ApplicationController
  def index
    @q            = Spin.with_artist_release_label.with_dj.recent.ransack(params[:q])
    @search_term  = params[:q].present? ? params[:q][:spin_cont].to_s : nil

    @pagy, @spins = pagy(@q.result)
  end

end
