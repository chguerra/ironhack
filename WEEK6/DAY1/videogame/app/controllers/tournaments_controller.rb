class TournamentsController < ApplicationController
  def index
    render(:index)
  end

  def returnjson
    tournaments = Tournament.all
    render status: 200, json: tournaments
  end

  def create
    tournament = Tournament.create tournament_params
    render status: 201, json: tournament
  end

  def destroy
    tournament = Tournament.find_by(id: params[:id])
    tournament.destroy
    render status: 204, json:tournament
  end


  private
  def tournament_params
    params.require(:tournament).permit(:name)
  end
end
