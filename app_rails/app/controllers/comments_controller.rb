# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def index
    @comments = Comment.all
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def edit; end

  def create
    if current_user.present?
      if current_user.comments.create(comment_params)
        redirect_to comments_path
      else
        render 'new'
      end
    else
      redirect_to comments_path
    end
  end

  def update
    if current_user.present?
      if @comment.update(comment_params)
        redirect_to comments_path
      else
        render 'edit'
      end
    else
      redirect_to comments_path
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:user_name, :content)
  end
end
