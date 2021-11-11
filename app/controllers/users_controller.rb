class UsersController < ApplicationController
    skip_before_action :ensure_user_logged_in
  
    def new
      render "users/new"
    end
  
    def create
      user = User.new(
        name: params[:name],
        gender: params[:gender],
        email: params[:email],
        password: params[:password],
        role: "Doctor",
      )
      if user.save
        doctor = Doctor.new(
          user_id: user.id,
          hospital_id: 1,
          specialization_id: params[:id],
        )
        doctor.save
        flash[:notice] = "Doctor account successfully!!"
        redirect_to "/"
      else
        flash[:error] = user.errors.full_messages.join(" , ")
        redirect_to new_user_path
      end
    end
  end