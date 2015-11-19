class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.string :title
      t.string :description
      t.float :deadline
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
