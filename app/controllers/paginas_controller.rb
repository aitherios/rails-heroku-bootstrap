class PaginasController < ApplicationController
  def show
    @pagina = Pagina.find(params[:slug])

    if request.path != pagina_path(@pagina)
      redirect_to pagina_path(@pagina), status: :moved_permanently
    end
  end
end
