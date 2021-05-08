# frozen_string_literal: true

class UserRequestsController < ApplicationController
  def new; end

  def index
    @my_requests = current_user.user_requests
    @publication_requests = UserRequest.joins(:publication)
                                       .where(publications: { user_id: current_user.id })
  end

  def show
    @user = if params[:user] == current_user
              current_user
            else
              User.find_by(user: params[:user])
            end
  end

  def create
    @publication = Publication.find_by(id: params[:publication_id])
    if current_user.present? && @publication.present?
      UserRequest.create(publication: @publication, user: current_user, status: 0)
      redirect_to publication_path @publication
    else
      render 'new'
    end
  end

  def edit
    @user_request = UserRequest.find_by(id: params[:id])
    @user_request.update(status: params[:status].to_i)
    redirect_to root_path
  end

  private

  def user_request_params
    params.require(:user_request).permit(:user, :publication)
  end
end
