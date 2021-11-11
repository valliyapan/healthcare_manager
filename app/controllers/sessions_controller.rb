class SessionsController < ApplicationController
  skip_before_action :ensure_user_login
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      flash[:notice] = user.name + " signed in successfully!"
      if user.role == "doctor"
        redirect_to doctors_path
      elsif user.role == "patient"
        redirect_to patients_path
      end
    else
      flash[:error] = "Invalid credentials"
      redirect_to sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    flash[:notice] = "Signed out successfully"
    redirect_to "/"
  end
end
