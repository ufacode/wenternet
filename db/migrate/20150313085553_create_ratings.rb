class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :item
      t.references :user
      t.references :voter
      t.integer :rating, limit: 1

      t.timestamps null: false
    end
  end
end
