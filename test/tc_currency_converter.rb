require_relative '../lib/currency_converter'
require 'rexml/document'
require_relative '../lib/util'
require 'test/unit'

class TestCurrencyConverter < Test::Unit::TestCase
  
  def setup
    @currency_converter = CurrencyConverter.new(getDoc())
  end


  def getDoc()
    doc = File.new("exchange_rates_test.xml")
    return doc
  end
 
  def test_exchange_rate()
    assert_equal(1.236, @currency_converter.get_exchange_rate("2017-03-14", "GBP", "USD"))
    assert_equal(0.0082, @currency_converter.get_exchange_rate("2017-03-14", "JPY", "EUR"))
    assert_equal(0.8091, @currency_converter.get_exchange_rate("2017-03-13", "USD", "GBP"))
    assert_equal(157.7615, @currency_converter.get_exchange_rate("2017-03-13", "BGN", "HUF"))
  end
  
  def test_convert_amount()
    assert_equal(150.79, Util.convert_amount("2017-03-15","122", "GBP", "USD", getDoc()))
    assert_equal(10975.63, Util.convert_amount("2017-03-15","97", "USD", "JPY", getDoc()))
    assert_equal(74.34, Util.convert_amount("2017-03-15","467.24", "CZK", "PLN", getDoc()))
  end

  def test_with_base_currency()
    assert_equal(888.14, Util.convert_amount("2017-03-15","1238", "AUD", "EUR", getDoc()))
    assert_equal(1238.07, Util.convert_amount("2017-03-15","888.14", "EUR", "AUD", getDoc()))
  end


  def test_same_amount()
    assert_equal("122", Util.convert_amount("2017-03-15","122", "GBP", "GBP", getDoc()))
    assert_equal("34.20", Util.convert_amount("2017-03-15","34.20", "EUR", "EUR", getDoc()))
    assert_equal("1235.60", Util.convert_amount("2017-03-15","1235.60", "USD", "USD", getDoc()))
  end

  def test_date_not_existing
    assert_equal(0, @currency_converter.get_exchange_rate("2017-03-18", "GBP", "USD"))
  end

end

