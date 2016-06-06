class SearchController < ApplicationController

  def index
    require "pry"
    binding.pry
  end

  private

    def connection
      url = "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=6&api_key=#{ENV['API_KEY']}"
      Faraday.new(url: url)
    end

    def search_params
      params.permit('q')
    end

    def search
      get 'https://api.data.gov/nrel/alt-fuel-stations/v1.json?api_key=ttRf0e4JymfK05atNs8xiHEzc7QAHUzigZKTvAYF&limit=6&location=80202&fuel=ELEC&&fuel=LPG&private=false&owner=all&radius=false&radius_miles=6'
    end
end
