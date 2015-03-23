class SearchController < ApplicationController
  def index; end

  def create
    @items = ItemSearch.new(search_params).results
  end

  private

  def search_params
    params[:search] || {}
  end
end
