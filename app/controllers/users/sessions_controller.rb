class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to posts_url, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def after_sign_in_path_for(_resource)
    posts_url
  end
end
