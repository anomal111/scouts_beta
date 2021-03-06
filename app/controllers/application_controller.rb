class ApplicationController < ActionController::Base
  protect_from_forgery 
  before_action :set_locale
  #filter_parameter_logging :password, :password_confirmation # there are underscores :-|

  helper_method :current_user_session, :current_user, :current_order
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def access_denied(exception)
      redirect_to admin_organizations_path, :alert => exception.message
  end
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
    
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
       # redirect_to home_index_path
        return false
      end
    end

    def store_location
      #session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
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