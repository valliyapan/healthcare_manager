class ApplicationController < ActionController::Base
    before_action :ensure_user_login
    def ensure_user_login
        unless current_user
            redirect_to "/"
        end
    end

    def current_user
        return @current_user if @current_user
        user_id = session[:current_user_id]
        user = User.find_by(id: user_id)
        if user
            @current_user = user
        else
            nil
        end
    end
end
