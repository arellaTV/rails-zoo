class ZoosController < ApplicationController
  def index
    @zoos = Zoo.all
  end

  def create
    @zoo = Zoo.new(zoo_params)
    
    if @zoo.save
      redirect_to @zoo
    else
      render 'new'
    end
  end

  def new
  end

  def show
    @zoo = Zoo.find(params[:id])
  end

  private
    def zoo_params
      params.require(:zoo).permit(:name, :description, :address);
    end
end
