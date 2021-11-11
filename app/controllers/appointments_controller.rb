class AppointmentsController < ApplicationController
  def index
    @current_user = current_user
    render "index"
  end

  def show
    id=params[:id]
    @doctor = Doctor.find(id)
    render "show"
  end

  def create
    day = params[:days].to_i
    slot = params[:slot].to_i
    id = params[:doctor].to_i
    doctor = Doctor.find(id)
    str = (8+slot+1).to_s+":00"
    date_time = Date.new((Date.today+day).strftime("%Y").to_i,
                (Date.today+day).strftime("%m").to_i,
                (Date.today+day).strftime("%d").to_i).to_datetime + Time.parse(str).seconds_since_midnight.seconds
    appointment = Appointment.new(patient_id: current_user.patient.id,
      hospital_id:1,
      doctor_id: doctor.id,
      appointment_time: date_time,
      book_time: DateTime.now,
      status: false
    )
    if appointment.save
      flash[:notice] = "Appointment created Successfully"
      @appointment = appointment
      redirect_to invoice_path
    else
      flash[:error] = appointment.errors.full_messages.join(" , ")
      redirect_to patients_appointments_path
    end
  end

  def invoice
    @current_user = current_user
    @appointment=current_user.patient.appointments.last
    render "invoice"
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @doctor = Appointment.find(params[:id]).doctor
    render "edit"
  end

  def update
    appointment = Appointment.find(params[:id])
    day = params[:days].to_i
    slot = params[:slot].to_i
    str = (8+slot+1).to_s+":00"
    appointment.appointment_time = Date.new((Date.today+day).strftime("%Y").to_i,
                                  (Date.today+day).strftime("%m").to_i,
                                  (Date.today+day).strftime("%d").to_i).to_datetime + Time.parse(str).seconds_since_midnight.seconds
    appointment.book_time = DateTime.now
    appointment.save
    flash[:notice] = "Appointment rescheduled successfully"
    redirect_to appointments_path
  end

  def destroy
    id=params[:id]
    appointment = Appointment.find(id)
    appointment.destroy
    redirect_to appointments_path
  end
end
