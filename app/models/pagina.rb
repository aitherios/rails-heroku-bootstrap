class Pagina < ActiveRecord::Base
  attr_accessible :conteudo, :slug, :titulo
  
  extend FriendlyId
  friendly_id :titulo, use: [:history, :slugged]
end
