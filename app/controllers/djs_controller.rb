class DjsController < ApplicationController

  def index
    @q = Dj.recent.ransack(params[:q])
    case @q.result.one?
    when true
      dj_id = @q.result.first.id
      redirect_to dj_path(dj_id)
    else
      @pagy, @djs = pagy(@q.result)
    end
  end

  def show
    @dj    = Dj.find(params[:id])
    @pagy, @spins = pagy(Spin.where(dj: @dj).with_artist_label.recent)
    @spins        = SpinDecorator.decorate_collection(@spins)
  end
end
