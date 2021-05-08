# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user.present?
      @user = if params[:id] == 'me'
                current_user
              else
                User.find_by(id: params[:id])
              end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_path
  end

  def new_user_request(_user)
    @user_request = UserRequest.find_by(id: params[:id])
    if current_user.present?
      if current_user.user_requests.create(publication_params)
        redirect_to user_path current_user
      else
        render 'new'
      end
    else
      redirect_to publications_path
    end
  end
end
