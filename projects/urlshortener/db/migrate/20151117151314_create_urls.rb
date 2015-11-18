class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :shortened_url
      t.string :url
      t.timestamps null: false
    end
  end
end
