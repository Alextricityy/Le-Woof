class PagesController < ApplicationController

  def home
    @dogs = Dog.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @user.dogs.each do |dog|
      @bookings << dog.bookings
    end
    authorize @bookings
  end

end
