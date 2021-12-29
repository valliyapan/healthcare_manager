class SpecializationsController < ApplicationController
    skip_before_action :ensure_user_login
  
    def new
      render "specializations/new"
    end
  
    def create
      specialization = Specialization.new(
        name: params[:name],
      )
      specialization.save
      flash[:notice]="Specialization Created!!"
      redirect_to patients_path
    end
end