class MainController < ApplicationController
  def index
    @cities = City.all
    @categories = Category.includes(:subcategories)
    @items = Item.all.newest.published.limit(10)
  end
end
