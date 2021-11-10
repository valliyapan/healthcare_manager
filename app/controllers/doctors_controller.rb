class DoctorsController < ApplicationController

  def index
    render :index
  end

  def edit
    render :edit
  end

  def home
    render :home
  end

  def update
    if params[:td]
      param = params[:td]
      day = param[0].to_i
      slot = param[2..-1].to_i
      doctor = @current_user.doctor
      if doctor.available(day,slot)
        doctor.find_day(day).delete(slot+1)
      else
        doctor.find_day(day).push(slot+1)
      end
      doctor.save!
      redirect_to edit_doctor_path
    else
      name = params[:name]
      email = params[:email]
      password = params[:password]
      gender = params[:gender]
      user = @current_user.update(name: name,email: email, password: password, gender: gender)
      if user
        flash[:notice] = "Updated Successfully!"
        redirect_to "/doctors/home"
      else
        flash[:error] = "Invalid input!"
        redirect_to "/doctors/#{@current_user.doctor.id}/edit"
      end
    end
  end

end
