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

    helper_method :admin
    def checkadmin
        if current_user
            redirect_to root_path, notice: "You don't have permission to do that!" unless admin?
        else
            redirect_to root_path, notice: "Please login with your admin account"
        end
    end

    def admin?
        current_user.role == "admin"
    end
end