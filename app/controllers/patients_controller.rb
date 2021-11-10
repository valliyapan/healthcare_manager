class PatientsController < ApplicationController
  def index
    @current_user = current_user
    render "index"
  end
end
