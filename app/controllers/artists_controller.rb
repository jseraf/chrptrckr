class ArtistsController < ApplicationController

  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    @artist       = Artist.find(params[:id])
    @pagy, @spins = pagy(Spin.where(artist: @artist))
  end

end
