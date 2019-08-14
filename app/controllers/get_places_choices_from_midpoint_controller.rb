class GetPlacesChoicesFromMidpointController < ApplicationController
  require 'HTTParty'
  def foo
    lat, lon  = params['lat'], params['lon']
    response = HTTParty.get("https://api.yelp.com/v3/businesses/search?latitude=#{lat}&longitude=#{lon}",headers: {"Authorization" => "Bearer GXHILCW8iiPEDUbfYwUXO2J5-CLmd4LHj0jjNYJPg-8eUTtISLw8eXedGhzH_6eFj7cy8sfYAH-5QvT8r6zF9JVybTsiFOq7FiDCzUwVAqRSOuvL9KfAIlAfAaRMXXYx"}) 
    # next step is to refactor
    render json: [{lat: lat, lon: lon, data: response.parsed_response}]
  end
end
