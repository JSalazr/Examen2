class OwnersController < ApplicationController
  skip_before_action :authenticate

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      login(@owner)
      OwnerNotifierMailer.signup_email(@owner).deliver
    else
      render :new
    end
  end

  def car
    @cars = Car.where(["owner_id = ?", current_owner.id])
  end

  protected

  def owner_params
    params.require(:owner).permit!
  end
end
