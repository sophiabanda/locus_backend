class GetPlacesChoicesFromMidpointController < ApplicationController
  def yelp
    lat, lon  = params['lat'], params['lon']
    url = "https://api.yelp.com/v3/businesses/search?latitude=#{lat}&longitude=#{lon}&sort_by=distance"
    response = HTTParty.get("#{url}",headers: {"Authorization" => "Bearer #{ENV['YELP_BEARER_TOKEN']}"})
    render json: [{data: response.parsed_response}]
  end
end
