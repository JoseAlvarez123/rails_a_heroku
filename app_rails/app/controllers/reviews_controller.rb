# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update]
  before_action :set_user, only: %i[update]

  def index
    @reviews = Reviews.all
    @user = User.find_by(id: params[:user_id])
  end

  def show; end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    @user = User.find_by(id: params[:user_id])
    if @user.recieved_reviews.create(create_params(params))
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:user_id])
  end

  def update
    if current_user.present?
      if review_update @review, params
        redirect_to user_path(@user)
      else
        render 'edit'
      end
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @user = User.find_by(id: @review.reviewed_id)
    @review.destroy
    redirect_to user_path(@user)
  end

  def set_review
    @review = Review.find_by(id: params[:id])
  end

  def set_user
    @user = User.find_by(id: @review.reviewed_id)
  end

  def create_params(params)
    { puntaje: params[:review][:puntaje],
      titulo: params[:review][:titulo],
      cuerpo: params[:review][:cuerpo],
      reviewer_id: current_user.id }
  end

  def review_update(review, params)
    review.update(puntaje: params[:review][:puntaje], titulo: params[:review][:titulo],
                  cuerpo: params[:review][:cuerpo])
  end
end
