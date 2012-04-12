class FrontendController < ApplicationController

  def index; end
  def show; render params[:template] end

end
