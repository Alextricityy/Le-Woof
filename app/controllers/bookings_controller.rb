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
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
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

  def set_user
    @user = User.find(params[:user_id])
  end

  def booking_params
    params.require(:booking).permit(:details, :start_time, :end_time)
  end
end
