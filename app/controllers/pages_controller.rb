class PagesController < ApplicationController

  def home
    @dogs = Dog.all
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings
    authorize @bookings
  end

end
