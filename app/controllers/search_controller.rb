class SearchController < ApplicationController

  def index
    @search_results = PgSearch.multisearch(params["Search"])
    render :index
  end
end
