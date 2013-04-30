class FrontendController < ApplicationController
  include Kss::ApplicationHelper

  def index; end

  def show
    render params[:template]
  end

end
