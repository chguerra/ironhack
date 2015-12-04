class CreateItemlists < ActiveRecord::Migration
  def change
    create_table :itemlists do |t|
      t.string :item_name
      t.references :barbecue, index: true
      t.timestamps null: false
    end
  end
end
