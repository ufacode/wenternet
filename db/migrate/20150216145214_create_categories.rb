class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: 64
      t.string :uri, limit: 64, unique: true, index: true

      t.timestamps null: false
    end
  end
end
