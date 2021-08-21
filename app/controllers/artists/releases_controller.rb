class Artists::ReleasesController < ArtistsController
  before_action :set_artist
  before_action :set_release, only: :show

  def show
    @pagy, @spins = pagy(Spin.where(artist: @artist,release: @release)
                           .with_release_label
                           .with_dj
                           .recent)
    @spins = SpinDecorator.decorate_collection(@spins)
  end

  private

  def set_artist
    @artist = Artist.friendly.find(params[:artist_id])
  end

  def set_release
    @release = Release.find(params[:id])
  end
end
