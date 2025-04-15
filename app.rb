require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "json"
require "http"

get("/") do
  
  # get currency options
  currency_api_currencies_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"

  parsed_currencies_body = JSON.parse(HTTP.get(currency_api_currencies_url))
  @currencies = parsed_currencies_body.fetch("currencies").keys

  erb(:home)

end

get("/:from_currency") do
  
  @from_currency = params.fetch("from_currency")

  # get currency options
  currency_api_currencies_url = "https://api.exchangerate.host/list?access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"

  parsed_currencies_body = JSON.parse(HTTP.get(currency_api_currencies_url))
  @currencies = parsed_currencies_body.fetch("currencies").keys

  @currencies.delete(@from_currency)

  erb(:from_currency)

end

get("/:from_currency/:to_currency") do

  @from_currency = params.fetch("from_currency")
  @to_currency = params.fetch("to_currency")

  # get exchange rate
  exchange_rate_api_url = "https://api.exchangerate.host/convert?from=#{@from_currency}&to=#{@to_currency}&amount=1&access_key=#{ENV.fetch("EXCHANGE_RATES_KEY")}"

  @exchange_rate = JSON.parse(HTTP.get(exchange_rate_api_url)).fetch("result")

  erb(:from_currency_to_currency)
end
