class PagesController < ApplicationController
  def show
    render_page_template or
    render_page_content or
    render_not_found
  end

  private

  def render_page_template
    render "pages/#{params[:slug]}" if template_exists?("pages/#{params[:slug]}")
  end

  def render_page_content
    @page = Page.find_by_slug params[:slug]

    case
    when (@page.present? and (request.path != page_path(@page)))
      redirect_to page_path(@page), status: :moved_permanently
    when @page.present?
      render 'show'
    end
  end
end
