class ArtistsController < ApplicationController
  def index
    @q_artist = Artist.ransack(params[:q])

    case @q_artist.result.one?
    when true
      artist = find_artist_by_id(@q_artist.result.first.id)
      redirect_to artist_path(artist)
    else
      @pagy, @artists = pagy(@q_artist.result)
    end
  end

  def show
    begin
      @artist = find_artist_by_id(params[:id])
    rescue
      flash[:alert] = 'Artist not found.'
      redirect_to root_url
    end

    @pagy, @spins = pagy(Spin.where(artist: @artist)
                          .with_release_label
                          .with_dj
                          .recent)
  end

  private

  def find_artist_by_id(id)
    Artist.friendly.find(id)
  end
end
