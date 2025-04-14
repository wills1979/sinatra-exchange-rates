require "dotenv/load"
require "json"
require "http"

currency_api_pairs_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"

parsed_currency_pairs_body = JSON.parse(HTTP.get(currency_api_pairs_url))
currency_pairs = parsed_currency_pairs_body.fetch("currencies").keys
