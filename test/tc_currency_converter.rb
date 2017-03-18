require_relative "../lib/currency_converter"
require 'rexml/document'
require "test/unit"
class TestCurrencyConverter < Test::Unit::TestCase
  def test_get_exchange_rate
   returnreturn
    xml = %{
    <Cube>
    <Cube time="2017-03-14">
    <Cube currency="USD" rate="1.0631"/><Cube currency="JPY" rate="122.13"/><Cube currency="BGN" rate="1.9558"/><Cube currency="CZK" rate="27.021"/><Cube currency="DKK" rate="7.4338"/><Cube currency="GBP" rate="0.87563"/><Cube currency="HUF" rate="311.32"/><Cube currency="PLN" rate="4.3221"/><Cube currency="RON" rate="4.5435"/><Cube currency="SEK" rate="9.4968"/><Cube currency="CHF" rate="1.0726"/><Cube currency="NOK" rate="9.151"/><Cube currency="HRK" rate="7.426"/><Cube currency="RUB" rate="63.1241"/><Cube currency="TRY" rate="3.9776"/><Cube currency="AUD" rate="1.4073"/><Cube currency="BRL" rate="3.3591"/><Cube currency="CAD" rate="1.4338"/><Cube currency="CNY" rate="7.3511"/><Cube currency="HKD" rate="8.2598"/><Cube currency="IDR" rate="14213.91"/><Cube currency="ILS" rate="3.8947"/><Cube currency="INR" rate="69.917"/><Cube currency="KRW" rate="1222.47"/><Cube currency="MXN" rate="20.8468"/><Cube currency="MYR" rate="4.7303"/><Cube currency="NZD" rate="1.5389"/><Cube currency="PHP" rate="53.481"/><Cube currency="SGD" rate="1.5039"/><Cube currency="THB" rate="37.554"/><Cube currency="ZAR" rate="13.9904"/>
    </Cube>
    <Cube time="2017-03-13">
    <Cube currency="USD" rate="1.0731"/><Cube currency="JPY" rate="122.13"/><Cube currency="BGN" rate="1.9558"/><Cube currency="CZK" rate="27.021"/><Cube currency="DKK" rate="7.4338"/><Cube currency="GBP" rate="0.87563"/><Cube currency="HUF" rate="311.32"/><Cube currency="PLN" rate="4.3221"/><Cube currency="RON" rate="4.5435"/><Cube currency="SEK" rate="9.4968"/><Cube currency="CHF" rate="1.0726"/><Cube currency="NOK" rate="9.151"/><Cube currency="HRK" rate="7.426"/><Cube currency="RUB" rate="63.1241"/><Cube currency="TRY" rate="3.9776"/><Cube currency="AUD" rate="1.4073"/><Cube currency="BRL" rate="3.3591"/><Cube currency="CAD" rate="1.4338"/><Cube currency="CNY" rate="7.3511"/><Cube currency="HKD" rate="8.2598"/><Cube currency="IDR" rate="14213.91"/><Cube currency="ILS" rate="3.8947"/><Cube currency="INR" rate="69.917"/><Cube currency="KRW" rate="1222.47"/><Cube currency="MXN" rate="20.8468"/><Cube currency="MYR" rate="4.7303"/><Cube currency="NZD" rate="1.5389"/><Cube currency="PHP" rate="53.481"/><Cube currency="SGD" rate="1.5039"/><Cube currency="THB" rate="37.554"/><Cube currency="ZAR" rate="13.9904"/>
    </Cube>
    </Cube>}
   
    doc = REXML::Document.new xml
       
    arr = REXML::XPath.match(doc, '//Cube[@time="2017-03-13"]/Cube[@currency="USD"]/@rate')
    arr.each { |x| puts x.value }
   
#    assert_equal(4, SimpleNumber.new(2).add(2) )
#    assert_equal(6, SimpleNumber.new(2).multiply(3) )
  end
end