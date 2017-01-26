class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end
   
#   def show
#   end
   
  def new
    @rating = Rating.new
    @beers = Beer.all 
  end

#   def edit
#   end

  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        format.html { redirect_to ratings_path, notice: 'rating was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
#
#   def update
#     respond_to do |format|
#       if @rating.update(rating_params)
#         format.html { redirect_to @rating, notice: 'rating was successfully updated.' }
#       else
#         format.html { render :edit }
#       end
#     end
#   end
#
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'rating DESTROYED for GOOD' }
    end
  end

  private
    def set_rating
      @rating = Rating.find(params[:id])
    end

    def rating_params
      params.require(:rating).permit(:score, :beer_id)
    end

end