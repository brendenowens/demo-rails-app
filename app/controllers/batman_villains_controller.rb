class BatmanVillainsController < ApplicationController
  def create
    @villain = BatmanVillain.new(:name => params[:name])
    render json: @villain, status: :created
  end
end
