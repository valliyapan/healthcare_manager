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
    role = params[:role]
    gender = params[:gender]
    user = User.new(
      name: name,
      email: email,
      password: password,
      role: role,
      gender: gender
    )
    if user.save
      session[:current_user_id] = user.id
      if user.role == "doctor"
        redirect_to doctors_path
      end
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def destroy
    id = params[:id]
    User.find(id).destroy
    redirect_to users_path
  end


end
