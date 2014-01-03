class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to new_car_path,
        notice: 'Congratulations.  Your car has been saved!'
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :description, :year, :mileage)
  end

end