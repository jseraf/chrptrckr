class DjsController < ApplicationController
  def show
    @dj    = Dj.find(params[:id])
    @pagy, @spins = pagy(Spin.where(dj: @dj))
  end
end
