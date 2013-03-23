class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :message

  validates :email, :message, presence: true
end
