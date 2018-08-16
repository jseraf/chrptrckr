class DjsController < ApplicationController
  def index
    @pagy, @djs = pagy(Dj.all)
  end

  def show
    @dj    = Dj.find(params[:id])
    @pagy, @spins = pagy(Spin.where(dj: @dj).with_artist_label.recent)
  end
end
