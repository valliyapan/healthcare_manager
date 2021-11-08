class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: "Patient",
      gender: "Male"
    )
    if user.save
      session[:current_user_id] = user.id
      patient = Patient.new(
        user_id: user.id,
        is_blocked: false
      )
      flash[:notice] = "Account created successfully!!"
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(" , ")
      redirect_to new_user_path
    end
  end
end
