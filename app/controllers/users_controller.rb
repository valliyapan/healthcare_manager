class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
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
    User.create!(
      name: name,
      email: email,
      password: password,
      role: role,
      gender: gender
    )
    redirect_to users_path
  end

  def destroy
    id = params[:id]
    User.find(id).destroy
    redirect_to users_path
  end
end
