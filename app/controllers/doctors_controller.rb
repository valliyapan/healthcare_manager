class DoctorsController < ApplicationController

  def index
    render :index
  end

  def edit
    render :edit
  end

  def update
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
  end

end
