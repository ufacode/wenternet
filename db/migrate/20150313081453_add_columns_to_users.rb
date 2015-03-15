class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating, :integer
    add_column :users, :rating_plus, :integer
    add_column :users, :rating_minus, :integer
  end
end
