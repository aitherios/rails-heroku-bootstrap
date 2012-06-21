class Pagina < ActiveRecord::Base
  attr_accessible :conteudo, :slug, :titulo
  
  extend FriendlyId
  friendly_id :titulo, use: [:history, :slugged]
  
  def should_generate_new_friendly_id?
    slug.blank?
  end
end
