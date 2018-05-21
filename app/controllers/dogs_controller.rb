class DogsController < ApplicationController

  def index
    @dogs = Dog.all
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
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :description, :breed, :gender, :image_url, :size, :price)
  end

end
