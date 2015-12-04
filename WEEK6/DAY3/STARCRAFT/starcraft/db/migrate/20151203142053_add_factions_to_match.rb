class AddFactionsToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :winner_faction, :integer
    add_column :matches, :loser_faction, :integer
  end
end
