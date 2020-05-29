class Admin::AnimalsController < ApplicationController
  def create
    @zoo = Zoo.find(params[:zoo_id])
    @animal = @zoo.animals.create(animal_params)
    redirect_to edit_zoo_path(@zoo)
  end

  def destroy
    @zoo = Zoo.find(params[:zoo_id])
    @animal = @zoo.animals.find(params[:id])
    @animal.destroy
    redirect_to edit_zoo_path(@zoo)
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :description)
    end
end
