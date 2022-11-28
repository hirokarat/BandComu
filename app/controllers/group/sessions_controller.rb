# frozen_string_literal: true

class Group::SessionsController < Devise::SessionsController
  def new_guest
    team = Team.guest
    sign_in team   # ユーザーをログインさせる
    redirect_to top_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
