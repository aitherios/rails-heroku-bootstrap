class Page < ActiveRecord::Base
  attr_accessible :content, :slug, :title
  
  extend FriendlyId
  friendly_id :title, use: [:history, :slugged]
  
  def should_generate_new_friendly_id?
    slug.blank?
  end
end
