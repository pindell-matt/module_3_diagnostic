class Station < ActiveRecord::Base

  def initialize(params)
    @name         = params["station_name"]
    @address      = formatted_street_address(params)
    @fuel_type    = params["fuel_type_code"]
    @access_times = params["access_days_time"]
    @distance     = "TBD"
  end

  def formatted_street_address(params)
    "#{params['street_address']}, #{params['city']} #{params['zip']}"
  end

end
