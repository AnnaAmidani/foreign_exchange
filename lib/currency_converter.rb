require 'rexml/document'
require_relative 'constants'

class CurrencyConverter  


  def get_exchange_rate(ref_date, base_currency, counter_currency)
    file = File.new("bin/exchange_rates.xml")
    doc = REXML::Document.new file
    base = 1
    counter = 1
    if base_currency == Constants::REFERENCE_CURRENCY
      counter = REXML::XPath.match(doc, '//Cube[@time="' + ref_date + '"]/Cube[@currency="' + counter_currency + '"]/@rate').at(0).value
    elsif counter_currency == Constants::REFERENCE_CURRENCY
      base = REXML::XPath.match(doc, '//Cube[@time="' + ref_date + '"]/Cube[@currency="' + base_currency + '"]/@rate').at(0).value
    else
      base = REXML::XPath.match(doc, '//Cube[@time="' + ref_date + '"]/Cube[@currency="' + base_currency + '"]/@rate').at(0).value
      counter = REXML::XPath.match(doc, '//Cube[@time="' + ref_date + '"]/Cube[@currency="' + counter_currency + '"]/@rate').at(0).value
    end 
    exchange_rate = (counter.to_f / base.to_f).round(4)
    return exchange_rate  
  end
  
  
    
  def convert_amount(params)
    base_currency = params['base_currency']
    counter_currency = params['counter_currency']
    if(base_currency == counter_currency)
      return params['base_amount']
    end
    exchange_rate = get_exchange_rate(params['ref_date'], base_currency, counter_currency)
    converted_amount = (params['base_amount'].to_f * exchange_rate).round(2)
    return converted_amount
  end
  
end
  
  
