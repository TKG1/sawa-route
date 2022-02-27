class MapsController < ApplicationController
  def index; end

  def show
    map = Map.find(params[:id])
    gon.lat = map.latitude.to_f
    gon.lng = map.longitude.to_f
  end
end
