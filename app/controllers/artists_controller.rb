class ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    case @q.result.count
    when 1
      artist_id = @q.result.first.id
      redirect_to artist_path(artist_id)
    else
      @pagy, @artists = pagy(@q.result)
    end
  end

  def show
    begin
      @artist = Artist.friendly.find(params[:id])
    rescue
      flash[:alert] = 'Artist not found.'
      redirect_to root_url
    end

    @pagy, @spins = pagy(Spin.where(artist: @artist)
                             .with_release_label.recent)
  end
end
