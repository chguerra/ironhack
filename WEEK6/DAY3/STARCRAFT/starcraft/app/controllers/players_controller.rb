class PlayersController < ApplicationController
  def show
    @matches = Player.create_player_output(Match.where('winner_id=? OR loser_id=?',params[:player_id],params[:player_id]), params[:player_id])
  end
end
