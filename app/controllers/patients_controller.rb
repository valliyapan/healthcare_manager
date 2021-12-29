class PatientsController < ApplicationController
  def index
    @current_user = current_user
    if @current_user.role == "patient"
      render "index"
    elsif @current_user.role == "admin"
      render "show"
    end
  end

  def option
    @display = false
    @current_user=current_user
    render "option"
  end

  def list
    render "list"
  end
  
  def blocked
    @blocked = Patient.where(is_blocked: true)
    render "blocked"
  end

  def unblock
    patient = Patient.find(params[:id])
    appointment = patient.appointments.find_by(status: false)
    appointment.update(status: true)
    patient.update(is_blocked: false)
    flash[:notice] = "Patient Unblocked Successfully!"
    redirect_to patients_path
  end
  
  def update
    name=params[:name]
    email=params[:email]
    password=params[:password]
    user = @current_user.update(name: name,email: email,password: password)
    if user
      flash[:notice] = "Profile edited successfully"
      redirect_to patients_path
    else
      flash[:error] = "Field cannot be empty"
      redirect_to patient_path
    end
  end

  def destroy
    id=params[:id]
    patient = Patient.find(id)
    user=patient.user
    user.destroy
    redirect_to patients_path
  end

  def show
    @current_user = current_user
    render "profile"
  end 
end
