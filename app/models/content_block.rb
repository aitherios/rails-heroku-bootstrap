class ContentBlock < ActiveRecord::Base
  attr_accessible :name,
                  :body,
                  :original_body,
                  :href
  
  validates :name, :body, :original_body, presence: true
  validates :name, uniqueness: true
end
