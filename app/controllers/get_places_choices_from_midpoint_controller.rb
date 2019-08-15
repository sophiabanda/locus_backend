class GetPlacesChoicesFromMidpointController < ApplicationController
  require 'HTTParty'
  def yelp
    lat, lon  = params['lat'], params['lon']
    url = "https://api.yelp.com/v3/businesses/search?latitude=#{lat}&longitude=#{lon}"
    env_bearer_token = "GXHILCW8iiPEDUbfYwUXO2J5-CLmd4LHj0jjNYJPg-8eUTtISLw8eXedGhzH_6eFj7cy8sfYAH-5QvT8r6zF9JVybTsiFOq7FiDCzUwVAqRSOuvL9KfAIlAfAaRMXXYx"
    response = HTTParty.get("#{url}",headers: {"Authorization" => "Bearer #{env_bearer_token}"}) 
    # next step is to refactor
    render json: [{data: response.parsed_response}]
  end
end
