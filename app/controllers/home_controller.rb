class HomeController < ApplicationController
  skip_before_action :ensure_user_login
  skip_before_action :ensure_blocked_patients
  
  def index
    render :index
  end
end
