class AppointmentsController < ApplicationController
  def index
    @current_user = current_user.patient
    render "index"
  end

  def show
    id=params[:id]
    @doctor = Doctor.find(id)
    render "show"
  end

  def update
  end
end
