class SearchController < ApplicationController

  def index
    @search_results = multisearch_results_filter(PgSearch.multisearch(params["Search"]))
    render :index
  end
end
