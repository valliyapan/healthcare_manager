class HomeController < ApplicationController
  skip_before_action :ensure_user_login
  def index
    render :index
  end
end
