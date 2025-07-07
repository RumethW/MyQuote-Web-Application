class SearchController < ApplicationController
  def index
    category_query = params[:category_query]

    if category_query.present?
      @quotematch = Quote.joins(:categories)
                         .where("LOWER(categories.cat_name) LIKE ?", "%#{category_query.downcase}%")
    else
      @quotematch = Quote.none  # Return no results if no category is provided
    end
  end
end
