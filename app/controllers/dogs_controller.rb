class DogsController < ApplicationController
  before_action :set_dog, except: [:new, :index, :create]

  def index

    @dogs = policy_scope(Dog).order(created_at: :desc)
    if params[:search].present? && params[:location].present?
      search_dogs = Dog.search_everything(params[:search])
      users = User.near(params[:location], 20)
      location_dogs = []
      users.each do |u|
        u.dogs.each do |d|
          location_dogs << d
        end
      end
      @dogs = search_dogs & location_dogs

    elsif params[:location].present?
      users = User.near(params[:location], 20)
      location_dogs = []
      users.each do |u|
        u.dogs.each do |d|
          location_dogs << d
        end
      end
      @dogs = location_dogs

    elsif params[:search].present?
      @dogs = Dog.search_everything(params[:search])
    else
      @dogs = Dog.all
    end

    authorize @dogs


    # @dogs = policy_scope(Dog).order(created_at: :desc)
    @good_dogs = @dogs.select do |dog|
      !dog.user.latitude.nil? && !dog.user.longitude.nil?
    end


    @markers = @good_dogs.map do |dog|
      {
        lat: dog.user.latitude,
        lng: dog.user.longitude,
        infoWindow: { content: render_to_string(partial: "shared/info_window", locals: { dog: dog }) }
      }
    end

  end


  def new
    @dog = Dog.new
    authorize @dog
  end

  def create
    @dog = Dog.new(dog_params)
    authorize @dog
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render "new"
    end
  end

  def edit
    authorize @dog
  end

  def update
    authorize @dog
    @dog.update(dog_params)
    if @dog.save
      redirect_to dogs_path
    else
      render "edit"
    end
  end

  def destroy
    authorize @dog
    @dog.delete
  end

  def show
    @booking = Booking.new

    @already_booked_start = @dog.bookings.map { |booking| booking.start_time.strftime("%Y-%m-%e ") }
    @already_booked_end = @dog.bookings.map { |booking| booking.end_time.strftime("%Y-%m-%e ") }
    @review = Review.new
  # @reviews = Review.all
  authorize @dog

  @markers =
  {
    lat: @dog.user.latitude,
    lng: @dog.user.longitude,

  }
  @new = average_rating(@dog)
end

private
def set_dog
 @dog = Dog.find(params[:id])
end

def dog_params
  params.require(:dog).permit(:name, :description, :breed, :gender, :photo, :size, :price)
end

def average_rating(dog)
  total = 0
  dog.reviews.each do |review|
    total += review.rating
  end
  if dog.reviews.count >= 1
    return total/ dog.reviews.count
  else
    return 0
  end
end
end
