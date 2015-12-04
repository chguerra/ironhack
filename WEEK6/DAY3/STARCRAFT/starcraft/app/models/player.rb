require 'pry'

class Player < ActiveRecord::Base
  has_many :matches, class_name: "Match", foreign_key: "winner_id"
  has_many :matches, class_name: "Match", foreign_key: "loser_id"

  def self.create_player_output(matches, player_param_id)
    resultJSON = []
    winning_count = 0
    losing_count = 0
    total = 0

    matches.each do |match|

      if match.winner_id == player_param_id.to_i
        winning_count = winning_count + 1
      else
        losing_count = losing_count + 1
      end
      total = total + 1

      matchy = {"duration" => match.duration,
                "winner" => Player.find(match.winner_id).name,
                "loser" => Player.find(match.loser_id).name,
                "winner_faction" => Faction.find(match.winner_faction).name,
                "loser_faction" => Faction.find(match.loser_faction).name
      }
      resultJSON << matchy

    end

    stats = {
      "winning_stats" => "#{winning_count / total * 100}%",
      "losing_stats" => "#{losing_count / total * 100}%",
    }
    resultJSON << stats
    return resultJSON
  end
end
