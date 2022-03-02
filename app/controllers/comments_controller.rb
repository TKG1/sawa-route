class CommentsController < ApplicationController
  before_action :require_login, only: %i[create edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_route, only: %i[new edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
  end

  def edit; end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(route_id: params[:route_id])
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def set_route
    @route = Route.find(params[:route_id])
  end
end
