class VenuesController < ApplicationController
  def index
    @venues = Venue.all
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice] = "Venue created!"
      redirect_to venues_path
    else
      flash[:notice] = @venue.errors.full_messages
      render :new
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    if @venue.save
      flash[:notice] = "I'm glad you stopped lying about yourself!"
      redirect_to venues_path
    else
      flash[:notice] = @venue.errors.full_messages
      render :edit
    end
  end
  protected
  def venue_params
    params.require(:venue).permit(:building_name, :address)
  end
end
