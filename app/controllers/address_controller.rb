class AddressController < ApplicationController

  def home
    if params[:address]
      @address_to_check = params[:address].reject{ |key, val| val.blank? }.to_unsafe_hash().to_json
      url = "http://api.v3.factual.com/t/places-us/match?values=" + @address_to_check + "&KEY=" + FACTUAL_KEY
      result = Net::HTTP.get(URI.parse(url))
      matches = JSON.parse(result)['response']['data']
      if matches and matches.length > 0
        @address_exists = true
        @factual_id = matches[0]["factual_id"]
      end
    end
  end

  def lookup
    
  end
end
