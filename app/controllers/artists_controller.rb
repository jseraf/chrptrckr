class ArtistsController < ApplicationController

  def index
    @pagy, @artists = pagy(Artist.all)
  end

  def show
    begin
      @artist       = Artist.friendly.find(params[:id])
    rescue
      flash[:alert] = 'Artist not found.'
      redirect_to root_url
    end
    @pagy, @spins   = pagy(Spin.where(artist: @artist).with_label.recent)
  end

end
