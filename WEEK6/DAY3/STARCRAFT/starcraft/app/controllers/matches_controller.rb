require 'pry'

class MatchesController < ApplicationController
  def index
    @matches = Match.create_output(Match.all)
  end

  def faction
    @matches = Match.create_output(Match.where(winner_faction: Faction.find_by(name: params[:faction_id]).id)) + Match.create_output(Match.where(loser_faction: @faction.find_by(name: params[:faction_id]).id))
  end
end
