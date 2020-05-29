class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address);
    end
end
