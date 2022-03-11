class HomeController < ApplicationController
  def index
    @q = Route.ransack(params[:q])
    @routes =
      @q
        .result(distinct: true)
        .includes(mountain: :prefecture)
        .order(level: :ASC)
        .page(params[:page])
        .per(4)
  end
end
