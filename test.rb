require "dotenv/load"
require "json"
require "http"

@from_currency = "USD"
@to_currency = "EUR"

exchange_rate_api_url = "https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}&amount=1&access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"
 JSON.parse(HTTP.get(exchange_rate_api_url)).fetch("result")
