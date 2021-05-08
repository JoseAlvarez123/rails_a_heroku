# frozen_string_literal: true

class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[show edit update destroy]

  def index
    @publications = Publication.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @publication = Publication.find_by(id: params[:id])
    if current_user.present?
      if current_user.publications.create(publication_params)
        redirect_to user_path current_user
      else
        render 'new'
      end
    else
      redirect_to publications_path
    end
  end

  def update
    if current_user.present?
      if @publication.update(publication_params)
        redirect_to @publication
      else
        render 'edit'
      end
    else
      redirect_to publications_path
    end
  end

  def destroy
    @publication.destroy

    redirect_to user_path current_user
  end

  def set_publication
    @publication = Publication.find_by(id: params[:id])
  end

  private

  def publication_params
    params.require(:publication).permit(:title, :animal_type, :category, :price, :address)
  end
end
