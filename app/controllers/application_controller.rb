class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action:configure_permitted_parameters,if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_root_path
    else
      top_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      top_path
    end
  end

  def user_shut_out
    unless admin_signed_in?
      redirect_to top_path
    end
  end
  
  def after_sign_up_path_for(resource_or_scope)
    toppath
  end
 
  def set_search
    @search = Team.ransack(params[:q])
    @search_teams = @search.result
  end
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:name,:email,:age,:area,:count,:genre])
  end

end
