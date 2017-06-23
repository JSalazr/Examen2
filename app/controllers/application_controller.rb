class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_owner, :authenticate
  before_action :authenticate

  def login(owner)
  	session[:owner_id] = owner.id
  	redirect_to car_owner_path(owner.id)
  end

  def logout
  	reset_session
  	redirect_to root_path
  end

  def current_owner
    if session[:owner_id]
      @current_owner = Owner.find(session[:owner_id])
    end
  end

  def authenticate
    unless current_owner
      redirect_to root_path
    end
  end
end
