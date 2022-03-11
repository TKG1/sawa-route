class RoutesController < ApplicationController
  def index
    @q = Route.ransack(params[:q])
    @routes =
      @q
        .result(distinct: true)
        .includes(mountain: :prefecture)
        .order(level: :ASC)
        .page(params[:page])
        .per(6)
  end

  def show
    @route = params[:name].present? ? Route.find_by(name: params[:name]) : Route.find(params[:id])
    @comment = Comment.new
    @comments = @route.comments.includes(:route, :user).order(created_at: :asc)
  end

  def favorite
    @routes = current_user.favorite_routes.includes(mountain: :prefecture)
  end
end
