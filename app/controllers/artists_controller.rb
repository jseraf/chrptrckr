class ArtistsController < ApplicationController

  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    @artist       = Artist.friendly.find(params[:id])
    @pagy, @spins = pagy(Spin.where(artist: @artist).with_label.recent)
  end

end
