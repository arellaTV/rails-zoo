class ZoosController < ApplicationController
  layout "frontend"

  def index
    @zoos = Zoo.search(params[:search])
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address, :search);
    end
end
