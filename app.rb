require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "json"
require "http"

get("/") do
  
  # get currency pairs
  currency_api_pairs_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"

  parsed_currencies_body = JSON.parse(HTTP.get(currency_api_pairs_url))
  @currencies = parsed_currencies_body.fetch("currencies").keys


end
