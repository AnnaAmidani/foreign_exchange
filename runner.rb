require 'sinatra'
require_relative 'lib/currency_converter'
require_relative 'lib/constants'


get '/' do
  erb :home
end


post '/convert' do
  amount = convert_amount(params)
  if(amount == 0.0)
    @error = Constants::ERROR_MISSING_DATA
  else
    @converted_amount = params['counter_currency'].concat(" ").concat(amount.to_s)    
  end
  erb :home
end


def convert_amount(params)
    base_currency = params['base_currency']
    counter_currency = params['counter_currency']
    if(base_currency == counter_currency)
      return params['base_amount']
    end
    currency_converter = CurrencyConverter.new()
    exchange_rate = currency_converter.get_exchange_rate(params['ref_date'], base_currency, counter_currency)
    return (params['base_amount'].to_f * exchange_rate).round(2)
end
  