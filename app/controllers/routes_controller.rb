class RoutesController < ApplicationController
  def index
    @routes = Route.all
  end

  def show
    @route = params[:name].present? ? Route.find_by(name: params[:name]) : Route.find(params[:id])
  end
end
