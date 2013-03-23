class ContentBlock < ActiveRecord::Base
  attr_accessible :name, :body

  validates :name, :body, presence: true
  validates :name, uniqueness: true
end
