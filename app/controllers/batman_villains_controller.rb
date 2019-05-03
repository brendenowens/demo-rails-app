class BatmanVillainsController < ApplicationController
  def create
    @villain = BatmanVillain.new(:name => params[:name])
    render json: @villain, status: :created
  end

  def index
    @villains = BatmanVillain.all 
    render json: @villains, status: 200
  end
end
