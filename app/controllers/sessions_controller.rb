class SessionsController < ApplicationController
  skip_before_action :ensure_user_login
  skip_before_action :ensure_blocked_patients

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      if user.role == "doctor"
        flash[:notice] = user.name + " signed in successfully!"
        redirect_to doctors_path
      else
        if user.email_confirmed
          flash[:notice] = user.name + ", you have successfully signed in."
          redirect_to patients_path
        else
          flash[:error] = "Verify your mail to sign in!"
          redirect_to sessions_path
        end
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
