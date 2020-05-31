class Admin::AnimalsController < ApplicationController
  layout "admin"

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
    @zoos = Zoo.all
  end

  def edit
    @animal = Animal.find(params[:id])
    @zoos = Zoo.all
  end

  def create
    @zoo = Zoo.find(params[:animal][:zoo_id])
    @animal = @zoo.animals.create(animal_params)
    redirect_to edit_admin_animal_path(@animal)
  end

  def update
    @animal = Animal.find(params[:id])
    @zoo = Zoo.find(params[:animal][:zoo_id])
   
    @animal.update(animal_params)
    redirect_to edit_admin_animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:id])
    @zoo = Zoo.find(params[:animal][:zoo_id])
    @animal.destroy
    redirect_to edit_admin_animals_path
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :description, :cover_photo, :zoo_id)
    end
end
