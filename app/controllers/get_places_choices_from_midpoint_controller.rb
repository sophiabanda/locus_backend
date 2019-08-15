class GetPlacesChoicesFromMidpointController < ApplicationController
  require 'HTTParty'
  def yelp
    lat, lon  = params['lat'], params['lon']
    url = "https://api.yelp.com/v3/businesses/search?latitude=#{lat}&longitude=#{lon}"
    response = HTTParty.get("#{url}",headers: {"Authorization" => "Bearer #{ENV.fetch('YELP_BEARER_TOKEN')}"}) 
    # next step is to refactor
    render json: [{data: response.parsed_response}]
  end
end
