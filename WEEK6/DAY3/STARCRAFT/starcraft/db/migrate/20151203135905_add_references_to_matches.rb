class AddReferencesToMatches < ActiveRecord::Migration
  def change
    add_reference :matches, :winner, references: :players, index: true
    add_reference :matches, :loser, references: :players, index: true

  end
end
