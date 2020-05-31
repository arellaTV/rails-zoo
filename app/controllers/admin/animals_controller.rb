class Admin::AnimalsController < ApplicationController
  layout "admin"

  before_action :authenticate_user!

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
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to edit_admin_animal_path(@animal)
    else
      redirect_to new_admin_animal_path(@animal)
    end
  end

  def update
    @animal = Animal.find(params[:id])   
    @animal.update(animal_params)
    redirect_to edit_admin_animal_path(@animal)
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to admin_animals_path
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :description, :cover_photo, :zoo_id)
    end
end
