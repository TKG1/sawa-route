class RoutesController < ApplicationController
  def index
    @routes = Route.includes(mountain: :prefecture)
  end

  def show
    @route = params[:name].present? ? Route.find_by(name: params[:name]) : Route.find(params[:id])
    @comment = Comment.new
    @comments = @route.comments.includes(:route, :user).order(updated_at: :asc)
  end
end
