class FavoritesController < ApplicationController
  before_action :set_route

  def create
    current_user.favorites.create!(route_id: @route.id)
  end

  def destroy
    favorite = current_user.favorites.find_by(route_id: @route.id)
    favorite.destroy!
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end
end
