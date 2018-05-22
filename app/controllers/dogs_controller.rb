class DogsController < ApplicationController
  before_action :set_dog, except: [:new, :index, :create]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.user = current_user
    if @dog.save
      redirect_to dog_path(@dog)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    @dog.update(dog_params)
      if @dog.save
      redirect_to dogs_path
    else
      render "edit"
    end
  end

  def destroy
    @dog.delete
  end

  def show

  end

  private
  def set_dog
     @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :breed, :gender, :photo, :size, :price)
  end

end
