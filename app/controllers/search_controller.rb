class SearchController < ApplicationController

  def index
    results = JSON.parse(search.body)
    @stations = results["fuel_stations"].map do |station|
      Station.new(station)
    end
  end

  private

    def connection
      url = 'https://api.data.gov/nrel/alt-fuel-stations/v1.json'
      Faraday.new(url: url)
    end

    def search_params
      params.permit('q')
    end

    def search
      connection.get do |req|
        req.params['api_key']      = ENV['API_KEY']
        req.params['limit']        = 10
        req.params['location']     = search_params['q']
        req.params['fuel']         = 'ELEC'
        req.params['fuel']         = 'LPG'
        req.params['private']      = false
        req.params['radius_miles'] = 6
      end
    end
end
