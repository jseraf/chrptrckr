class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
    @pagy, @spins = pagy(Spin.where(label: @label))
  end
end
