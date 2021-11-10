class UsersController < ApplicationController
  skip_before_action :ensure_user_login
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    role = current_user ? "doctor" : "patient"
    gender = params[:gender]
    user = User.new(
      name: name,
      email: email,
      password: password,
      role: role,
      gender: gender
    )
    if user.save
      if user.role == "doctor"
        doctor = Doctor.new(
          hospital_id: 1,
          specialization_id: 1,
          user_id: user.id
        )
        doctor.save
        flash[:notice] = "Doctor created successfully!!"
        redirect_to "/"
      elsif user.role == "patient"
        session[:current_user_id] = user.id
        patient = Patient.new(
        user_id: user.id,
        is_blocked: false
        )
        patient.save
        flash[:notice] = "Account created successfully!!"
        redirect_to "/"
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

end
