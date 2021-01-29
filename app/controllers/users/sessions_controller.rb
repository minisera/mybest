class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to new_clothe_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def after_sign_in_path_for(resource)
    new_clothe_path
  end
end
