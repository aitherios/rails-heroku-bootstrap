# -*- coding: utf-8 -*-

class User < ActiveRecord::Base
  # :lockable, :timeoutable and :confirmable
  devise :database_authenticatable,
         :registerable,
         :token_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable
  
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :name

  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    data = access_token.info

    if usuario = self.find_by_email(data.email)
      usuario
    else
      self.create!(email: data.email, password: Devise.friendly_token[0,20], name: data.name)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |usuario|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        usuario.email = data['email']
        usuario.name = data['name']
      end
    end
  end

end
