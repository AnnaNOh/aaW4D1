class CommentsController < ApplicationController

  def index
    if params[:user_id]
      user_comments = Comment.where(user_id: params[:user_id])
      render json: user_comments
    elsif params[:artwork_id]
      user_comments = Comment.where(artwork_id: params[:artwork_id])
      render json: user_comments
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.delete
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end

private

  def comment_params
    params.require(:comments).permit(:artwork_id, :user_id, :body)
  end
end
