class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :attachment
      t.references :item
      t.timestamps
    end
    # add_foreign_key :images, :items
  end
end
