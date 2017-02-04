class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all 
  end

  def create
    @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
    if @rating.save
      current_user.ratings << @rating
      redirect_to user_path current_user, notice: '#{rating.beer.name} rated #{rating.score}'
    else
      @beers = Beer.all
      render :new, notice: 'something went wrong'
    end
  end
  
  def destroy
    #@rating.destroy
    rating = Rating.find(params[:id])
    rating.delete if current_user == rating.user
    redirect_to :back
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:score, :beer_id, :user_id)
    end

end