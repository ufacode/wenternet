class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string     :title
      t.decimal    :price
      t.text       :content
      t.string     :email
      t.string     :phone
      t.string     :state, index: true, limit: 32
      t.references :category
      t.references :subcategory
      t.references :city
      t.references :user
      t.timestamps
    end
    # add_foreign_key :items, :categories
    # add_foreign_key :items, :subcategories
    # add_foreign_key :items, :cities
    # add_foreign_key :items, :users
  end
end
