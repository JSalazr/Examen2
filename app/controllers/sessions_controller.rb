class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
    if current_owner
      redirect_to root_path
    end
  end

  def create
    password = params[:session][:password]
    email = params[:session][:email]


    @owner = Owner.find_by(email: email)

    if @owner && @owner.authenticate(password)
      login(@owner)
    else
      redirect_to login_path, flash: { error: "Email o Password incorrecto"}
    end
  end

  def show
    @current_owner = current_owner
  end

  def destroy
    logout
  end
end
