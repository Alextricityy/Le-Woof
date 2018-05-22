class BookingsController < ApplicationController
  before_action :set_dog, only: :create
  before_action :set_booking, only: :show

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.dog = @dog
    @booking.user = current_user
    @booking.price = @dog.price
    if @booking.save
      redirect_to dog_booking_path(@dog, @booking)
    else
      render "new"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show
    authorize @booking
  end

  private
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_dog
    @dog = Dog.find(params[:dog_id])
  end

  def booking_params
    params.require(:booking).permit(:details, :date)
  end

end
