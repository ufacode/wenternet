class SearchController < ApplicationController
  # GET /search
  def index; end

  # POST /search
  def create
    @items = ItemSearch.new(search_params).results
  end

  private

  def search_params
    params[:search] || {}
  end
end
