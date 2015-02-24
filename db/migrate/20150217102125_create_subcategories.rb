class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.string :uri, limit: 64, unique: true, index: true
      t.references :category

      t.timestamps
    end
    # add_foreign_key :subcategories, :categories
  end
end
