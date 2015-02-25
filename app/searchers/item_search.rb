class ItemSearch < Searchlight::Search
  search_on Item.all
  searches :query, :city, :category, :subcategory

  def search_query
    search.where("title LIKE :query OR content LIKE :query", query: "%#{query}%")
  end

  def search_city
    search.where(city: city)
  end

  def search_category
    search.where(category: category)
  end

  def search_subcategory
    search.where(subcategory: subcategory)
  end
end
