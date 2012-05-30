class User < ActiveRecord::Base
  # :lockable, :timeoutable and :confirmable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable#, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
end
