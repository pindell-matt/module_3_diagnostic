class SearchController < ApplicationController

  def index
    # conn.get '/nigiri', search_params
    require "pry"
    binding.pry
  end

  private

    def connection
      url = "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{ENV['API_KEY']}"
      Faraday.new(url: url)
    end

    def search_params
      params.permit('q')
    end
end
