class GetPlacesChoicesFromMidpointController < ApplicationController
  require 'HTTParty'
  def yelp
    lat, lon, limit  = params['lat'], params['lon'], params['limit']
    url = "https://api.yelp.com/v3/businesses/search?latitude=#{lat}&longitude=#{lon}&limit=#{limit}&sort_by=distance"
    response = HTTParty.get("#{url}",headers: {"Authorization" => "Bearer #{ENV["YELP_BEARER_TOKEN"]}"}) 
    render json: [{data: response.parsed_response}]
  end
end
