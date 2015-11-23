class ChangeTypeOfDataInConcert < ActiveRecord::Migration
  def self.up
    change_column :concerts, :price, :float
  end

  def self.down
    change_column :concerts, :price, :string
  end
end
