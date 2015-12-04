class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :duration
      t.datetime :date
      t.timestamps null: false
    end
  end
end
