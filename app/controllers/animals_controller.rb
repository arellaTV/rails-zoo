class AnimalsController < ApplicationController
  layout "frontend"

  def index
    @animals = Animal.search(params[:search])
  end

  def show
    @animal = Animal.find(params[:id])
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address);
    end
end
