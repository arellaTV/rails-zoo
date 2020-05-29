class AnimalsController < ApplicationController
  def create
    @zoo = Zoo.find(params[:zoo_id])
    @animal = @zoo.animals.create(animal_params)
    redirect_to zoo_path(@zoo)
  end

  private
    def animal_params
      params.require(:animal).permit(:name, :description)
    end
end
