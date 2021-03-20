class AttractionsController < ApplicationController
  def new
    if !current_user.admin
      redirect_to user_path(current_user)
    end
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    attraction = Attraction.find_by(id: params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
