class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :uri, limit: 64, unique: true, index: true

      t.timestamps
    end
  end
end
