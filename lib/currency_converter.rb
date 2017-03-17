require 'rexml/document'

class CurrencyConverter  

  def get_exchange_rate(ref_date, base_currency, counter_currency)
    file = File.new("bin/exchange_rates.xml")
    doc = REXML::Document.new file
    base = REXML::XPath.match(doc, '//Cube[@time="2017-03-13"]/Cube[@currency="GBP"]/@rate').at(0).value
    counter = REXML::XPath.match(doc, '//Cube[@time="2017-03-13"]/Cube[@currency="USD"]/@rate').at(0).value    
    base_rate = base.to_f
    counter_rate = counter.to_f

#   base_rate = puts REXML::XPath.match(doc, '//Cube[@time='"#{ref_date}"]/Cube[@currency="#{base_currency}"]/@rate')
 #  counter_rate = puts REXML::XPath.match(doc, '//Cube[@time="#{ref_date}"]/Cube[@currency="#{counter_currency}"]/@rate')
    #if(base_rate.nil || counter_rate.nil)
    #  return 0
    exchange_rate = (counter_rate / base_rate).round(4)
    return exchange_rate  
  end
    
  def convert_amount(params)
    base_amount = params['base_amount'].to_f
    exchange_rate = get_exchange_rate(params['ref_date'], params['base_currency'], params['counter_currency'])
    converted_amount = (base_amount * exchange_rate).round(2)
    return converted_amount
  end
  
end
  
  
