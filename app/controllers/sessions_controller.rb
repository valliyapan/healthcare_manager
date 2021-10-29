class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.role == "doctor"
        redirect_to doctor_path
      end
    else
      redirect_to sessions_path
    end
  end
end
