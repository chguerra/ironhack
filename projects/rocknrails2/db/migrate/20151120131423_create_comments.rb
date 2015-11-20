class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :concert, index: true
      t.integer :concert_id
      t.string :text
      t.timestamps null: false
    end
  end
end
