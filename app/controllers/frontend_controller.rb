class FrontendController < ApplicationController
  def index
    @entries = Dir.entries(Rails.root.join('app', 'views', 'frontend')) - [".", "..", "index.slim"]
  end

  def show
    render params[:template]
  end
end
