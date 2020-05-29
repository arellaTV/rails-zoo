class ZoosController < ApplicationController
  def new
  end

  def create
    render plain: params[:zoo].inspect
  end
end
