class UsersController < ApplicationController
  skip_before_action :ensure_user_login
  skip_before_action :ensure_blocked_patients

  def index
    render :index
  end

  def new
    if current_user && @current_user.role == "admin"
      render "users/newdoctor"
    else
      render "users/new"
    end
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
          specialization_id: params[:id],
          user_id: user.id
        )
        doctor.save
        flash[:notice] = "Doctor created successfully!!"
        redirect_to patients_path
      elsif user.role == "patient"
        session[:current_user_id] = user.id
        patient = Patient.new(
        user_id: user.id,
        is_blocked: false
        )
        patient.save
        UserMailer.registration_confirmation(user).deliver
        flash[:notice] = user.name + ", we have sent you a mail. Please click on the link to verify!"
        redirect_to new_user_path
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:notice] = user.name + ", you have successfully signed in!"
      redirect_to patients_path
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to "/"
    end
  end

end
