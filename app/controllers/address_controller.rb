require 'factual'

class AddressController < ApplicationController

  def home
    factual = Factual.new(FACTUAL_KEY, FACTUAL_SECRET)
    
    if params[:address]
      address = params[:address].reject{ |key, val| val.blank? }
      matches = factual.table("places-us").filters(address.to_unsafe_hash()).select("factual_id").rows
      if matches and matches.length > 0
        @factual_id = matches[0]["factual_id"]
      end
    end
  end

  def lookup
    
  end
end
