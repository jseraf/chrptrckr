class DjsController < ApplicationController

  def index
    @q_dj = Dj.recent.ransack(params[:q])
    case @q_dj.result.one?
    when true
      dj_id = @q_dj.result.first.id
      redirect_to dj_path(dj_id)
    else
      @pagy, @djs = pagy(@q_dj.result)
    end
  end

  def show
    @dj           = Dj.find(params[:id])
    @pagy, @spins = pagy(Spin.where(dj: @dj).with_artist_label.recent)
  end
end
