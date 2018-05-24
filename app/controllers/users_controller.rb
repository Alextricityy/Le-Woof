class UsersController < ApplicationController
  def dashboard
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
    @user.dogs.each do |dog|
      @bookings << dog.bookings
    end
    authorize @bookings
  end


  # def show
  #   @user = User.find(params[:id]) || current_user
  #   authorize @user
  # end

end
