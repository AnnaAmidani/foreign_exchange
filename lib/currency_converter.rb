require 'rexml/document'
require_relative 'constants'

class CurrencyConverter  
  
  def initialize(file)
    @doc = REXML::Document.new file
  end


  def get_exchange_rate(ref_date, base_currency, counter_currency)
    ref_date_node = REXML::XPath.match(@doc, '//Cube[@time="' + ref_date + '"]')
    if ref_date_node.empty?
      return 0
    end
    base = 1
    counter = 1
    if base_currency == Constants::REFERENCE_CURRENCY
      counter = REXML::XPath.match(ref_date_node, '//Cube[@currency="' + counter_currency + '"]/@rate').at(0).value
    elsif counter_currency == Constants::REFERENCE_CURRENCY
      base = REXML::XPath.match(ref_date_node, '//Cube[@currency="' + base_currency + '"]/@rate').at(0).value
    else
      base = REXML::XPath.match(ref_date_node, '//Cube[@currency="' + base_currency + '"]/@rate').at(0).value
      counter = REXML::XPath.match(ref_date_node, '//Cube[@currency="' + counter_currency + '"]/@rate').at(0).value
    end 
    return (counter.to_f / base.to_f).round(4)
  end
  
  
end
  
  
