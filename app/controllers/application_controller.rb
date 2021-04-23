class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    helper_method :authorized
    def logged_in?
        !current_user.nil?
      end
    
    def authorized
        redirect_to "/login" unless logged_in?
    end
end
