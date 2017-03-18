require 'sinatra'
require_relative 'lib/currency_converter'

get '/' do
  erb :home
end

post '/convert' do
  currency_converter = CurrencyConverter.new()
#  @converted_amount = amount.to_s + " " + params['counter_currency'].to_s
  @converted_amount = currency_converter.convert_amount(params)
  erb :home
end
