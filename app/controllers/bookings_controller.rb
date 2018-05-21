class BookingsController < ApplicationController

  def index

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show

  end
  private
  def set_dog
    @booking = Booking.find(params[:id])
  end

  def dog_params
    params.require(:booking).permit(:name, )
  end

end
