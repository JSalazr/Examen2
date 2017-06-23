class RentsController < ApplicationController
  skip_before_action :authenticate

  def new
      @car = Car.find(params[:car_id])
      @rent = @car.rents.build
  end

  def create
    @car = Car.find(params[:car_id])
    @rent = @car.rents.build(rents_params)
    @rent.total = @car.price_per_day * @rent.days

    if @rent.save
      OwnerNotifierMailer.rent_email(Owner.find_by(id: @car.owner_id), @rent).deliver
      redirect_to @car,  notice: "Carro "+@car.modelo+" rentado hasta el "+@rent.rent_end_at.to_formatted_s(:long)+"."
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:car_id])
    @rent = @car.rents.find(params[:id])
    @rent.destroy
    redirect_to @car,  notice: "Se borro con exito."
  end

protected

  def rents_params
        params.require(:rent).permit!
  end
end
