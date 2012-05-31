class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def facebook
    @user = User.find_for_facebook_oauth(request.env['omniauth.auth'], current_user)

    if @user.persisted?
      sign_in @user
      remember_me @user
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'Facebook')
      redirect_to(root_path, event: :authentication)
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_usuario_registration_url
    end
  end

end
