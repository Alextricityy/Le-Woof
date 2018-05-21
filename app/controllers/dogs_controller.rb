class DogsController < ApplicationController
  before_action :set_dog, except: [:new, :index]

  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    if @dog.save
      redirect_to dogs_path
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
    params.require(:dog).permit(:name, :description, :breed, :gender, :image_url, :size, :price)
  end

end
