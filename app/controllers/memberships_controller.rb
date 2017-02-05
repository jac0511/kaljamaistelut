class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  def index
    @memberships = Membership.all
  end

  def new
    @membership = Membership.new
    @beer_clubs = BeerClub.all
  end

  def create
    @membership = Membership.new(membership_params)
    if @membership.save
      current_user.memberships << @membership
      redirect_to user_path current_user, notice: '#{rating.beer.name} rated #{rating.score}'
    else
      @beer_clubs = BeerClub.all
      format.html { render :new }
      format.json { render json: @membership.errors, status: :unprocessable_entity }
    end
  end

  def destroy
  if current_user == @membership.user
    @membership.destroy 
    respond_to do |format|
      format.html { redirect_to user_path current_user, notice: 'Membership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:beer_club_id, :user_id)
    end
end
