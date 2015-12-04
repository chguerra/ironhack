class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  def self.create_output(matches)
    resultJSON = []
    matches.each do |match|
      matchy = {"duration" => match.duration,
                "winner" => Player.find(match.winner_id).name,
                "loser" => Player.find(match.loser_id).name,
                "winner_faction" => Faction.find(match.winner_faction).name,
                "loser_faction" => Faction.find(match.loser_faction).name
      }
      resultJSON << matchy
    end
    return resultJSON
  end

end
