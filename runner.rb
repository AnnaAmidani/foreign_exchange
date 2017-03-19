require 'sinatra'
require_relative 'lib/currency_converter'
require_relative 'lib/constants'
require_relative 'lib/util'


get '/' do
  erb :home
end

post '/convert' do
  amount = Util.convert_amount(params['ref_date'], params['base_amount'], params['base_currency'], params['counter_currency'], File.new("bin/exchange_rates.xml"))
  if(amount == 0.0)
    @error = Constants::ERROR_MISSING_DATA
  else
    @converted_amount = params['counter_currency'].concat(" ").concat(amount.to_s)    
  end
  erb :home
end


  