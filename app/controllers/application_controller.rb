class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_global_search

  def set_global_search
    @q = Spin.search(params[:q])
  end
end
