class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    unless current_user.admin?
      flash[:alert]='沒有權限！'
      redirect_to root_path
    end
  end
end
