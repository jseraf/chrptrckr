class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
    @pagy, @spins = pagy(Spin.where(label: @label).with_artist_release)
  end
end
