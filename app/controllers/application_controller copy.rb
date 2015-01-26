class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    def authenticate
      if !current_user
        redirect_to new_user_session_path
      end 
    end
    
    def admin_required
      if !current_user
        redirect_to new_user_session_path
      elsif !current_user.admin?
        flash[:notice] = "You are not allowed to do that."
        redirect_to root_url
      end 
    end
end
