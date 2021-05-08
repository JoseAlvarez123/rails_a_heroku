# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :set_reciever, only: :create

  def index
    if current_user.present?
      @users = User.all # cambiar por usuarios con solicitudes activas
      @reciever = User.find(params[:id]) if params[:id]
    else
      redirect_to publications_path
    end
  end

  def create
    if @reciever && current_user.present?
      @message = current_user.sent_messages.create(content: params[:message][:content],
                                                   reciever_id: @reciever.id)
      redirect_to messages_path(id: @reciever.id)
    else
      redirect_to publications_path
    end
  end

  def update
    @message = Message.find(params[:id])
    @message.update(content: params[:message][:content])
    redirect_to messages_path(id: @message.reciever_id)
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @reciever_id = @message.reciever_id
    @message.destroy
    redirect_to messages_path(id: @reciever_id)
  end

  def set_reciever
    @reciever = User.find(params[:user_id])
  end
end
