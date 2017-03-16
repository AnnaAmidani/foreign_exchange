require 'sinatra'
require_relative 'lib/currency_converter'

get '/' do
  erb :home
end

post '/convert' do
  currency_converter = CurrencyConverter.new()
  @final_currency = params['counter_currency']
  @converted_amount = currency_converter.convert_amount(params) 
  erb :home
end
