class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in
  
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:current_user_id] = user.id
        flash[:notice] = "Login Successful!!"
        redirect_to patients_path
      else
        flash[:error] = "Your login attempt is invalid . Please retry"
        redirect_to new_sessions_path
      end
    end
  
    def destroy
      session[:current_user_id] = nil
      @current_user = nil
      flash[:notice] = "Signed out successfully"
      redirect_to "/"
    end
  end