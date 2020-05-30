class Admin::AnimalsController < ApplicationController
  layout "admin"

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
    @zoos = Zoo.all
  end

  def create
    @zoo = Zoo.find(params[:zoo_id])
    @animal = @zoo.animals.create(animal_params)
    redirect_to edit_admin_zoo_path(@zoo)
  end

  def destroy
    @zoo = Zoo.find(params[:zoo_id])
    @animal = @zoo.animals.find(params[:id])
    @animal.destroy
    redirect_to edit_admin_zoo_path(@zoo)
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :description, :cover_photo)
    end
end
