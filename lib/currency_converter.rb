require 'rexml/document'

class CurrencyConverter  

  def get_exchange_rate(ref_date, base_currency, counter_currency)
    file = File.new("bin/exchange_rates.xml")
    doc = REXML::Document.new file
    base_rate_list = REXML::XPath.match(doc, "//Cube[@time='2017-03-15']/Cube[@currency='EUR']/@rate")
    base_rate = base_rate_list.value


    #base_rate = REXML::XPath.first(doc, "//Cube[@time='#{ref_date}']/Cube[@currency='#{base_currency}']").attributes["rate"].value
  
    counter_rate = REXML::XPath.first(doc, "//Cube[@time='#{ref_date}']/Cube[@currency='#{counter_currency}']/@rate").value
    exchange_rate = (counter_rate.compact[0].to_f / base_rate.compact[0].to_f).round(4)
    return exchange_rate
  end
    
  def convert_amount(params)
    base_amount = params['base_amount'].to_f
    exchange_rate = get_exchange_rate(params['ref_date'], params['base_currency'], params['counter_currency'])
    converted_amount = (base_amount * exchange_rate).round(2)
    return converted_amount
  end
  
end
  
  
