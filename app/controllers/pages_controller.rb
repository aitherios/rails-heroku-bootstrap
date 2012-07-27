class PagesController < ApplicationController
  def show
    @page = Page.find(params[:slug])

    if request.path != page_path(@page)
      redirect_to page_path(@page), status: :moved_permanently
    end
  end
end
