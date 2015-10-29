class AnimalsController < ApplicationController

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new(animal_params)
    if animal.save
      redirect_to animal_path(animal)
    else
      flash[:error] = animal.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :age)
  end
end
