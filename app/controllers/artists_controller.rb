class ArtistsController < ApplicationController
  def index
    @q = Artist.ransack(params[:q])
    case @q.result.one?
    when true
      artist = find_artist_by_id(@q.result.first.id)
      redirect_to artist_path(artist)
    else
      @pagy, @artists = pagy(@q.result)
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
                          .with_release_label.recent)
    @spins = SpinDecorator.decorate_collection(@spins)
  end

  private

  def find_artist_by_id(id)
    Artist.friendly.find(id)
  end
end
