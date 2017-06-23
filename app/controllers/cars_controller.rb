class CarsController < ApplicationController

  skip_before_action :authenticate, except: [:new, :create, :edit, :update, :destroy]

  def index
    @cars = Car.order(:modelo)
  end

  def show
    @car = Car.find(params[:id])

  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    @car.owner_id = current_owner.id
    
    if @car.save
      redirect_to cars_path, notice: "Se agrego exitosamente."
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update_attributes(car_params)
      redirect_to car_path(@car),  notice: "Se edito con exito."
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path,  notice: "Se borro con exito."
  end

  protected

  def car_params
    params.require(:car).permit!
  end
end
