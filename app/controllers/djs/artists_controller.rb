class Djs::ArtistsController < DjsController
  before_action :set_artist, only: :show

  def index
    @dj = Dj.find(params[:dj_id])
    @pagy, @artists = pagy(Artist.joins(:spins).merge(Spin.with_artist.by_dj(@dj)))
  end

  def show
    @dj    = Dj.find(params[:dj_id])
    @pagy, @spins = pagy(Spin.where(dj: @dj).where(artist: @artist).with_artist_label.recent)
    @spins = SpinDecorator.decorate_collection(@spins)
  end

  private
  def set_artist
    @artist = Artist.friendly.find(params[:id])
  end
end
