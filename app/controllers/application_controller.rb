class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_global_search

  def set_global_search
    @q = Spin.ransack(params[:q])
  end
end
