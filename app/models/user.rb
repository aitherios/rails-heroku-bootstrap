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
                  :name,
                  :remote_avatar_url,
                  :avatar,
                  :logged_with_facebook


  validates :name, presence: true
  
  mount_uploader :avatar, AvatarUploader
  
  def update_attributtes_for(data)
    if data.image.present?
      update_attributes(imagem: data.image)
    end
  
    if data.nome.present?
      update_attributes(nome: data.name)
    end
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    data = access_token.info

    if user = self.find_by_email(data.email)
      user.update_attributes(name: data.name) if user.name.blank?
      user
    else
      self.create!(email: data.email, 
                   password: Devise.friendly_token[0,20], 
                   name: data.name, 
                   remote_avatar_url: data['image'].gsub!('square', 'normal'), 
                   logged_with_facebook: true)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email']
        user.name = data['name']
        user.remote_avatar_url = data['image'].gsub!('square', 'normal')
      end
    end
  end

end