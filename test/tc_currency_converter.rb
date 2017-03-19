require_relative '../lib/currency_converter'
require 'rexml/document'
require_relative '../lib/util'
require 'test/unit'

class TestCurrencyConverter < Test::Unit::TestCase
  
  def setup
    @doc = File.new("exchange_rates_test.xml")
    @currency_converter = CurrencyConverter.new(@doc)
  end

  def test_converter_constructor_nothing_raised()
    assert_nothing_raised(CurrencyConverter.new(@doc))
  end

  def test_converter_constructor_raise()
    assert_raise(CurrencyConverter.new("file.xml"))
  end

  def test_same_amount()
    assert_equal(122.20, Util.convert_amount(122.20, "2017-03-15", "GBP", "GBP"))
  end
 
  def test_exchange_rate()
    puts @currency_converter.get_exchange_rate("2017-03-14", "GBP", "USD")   
    puts @currency_converter.get_exchange_rate("2017-03-14", "JPY", "EUR") 
    puts @currency_converter.get_exchange_rate("2017-03-13", "USD", "GBP")   
    puts @currency_converter.get_exchange_rate("2017-03-13", "BGN", "HUF")   
#    assert_equal(1.0631, @converter.get_exchange_rate("2016-10-14", "USD", "GBP"))
#    assert_equal(0.9089, @converter.get_exchange_rate("2016-10-14", "USD", "EUR"))
#    assert_equal(63.6245, @converter.get_exchange_rate("2016-10-14", "CHF", "RUB"))
#    assert_equal(1.0104, @converter.get_exchange_rate("2016-10-14", "CHF", "USD"))
  end
  
  def test_same_currency()
    assert_equal(122.20, Util.convert_amount(122.20, "2017-03-13", "GBP", "GBP", @doc))
  end

  def test_convert_amount()
    #assert_equal(122.20, Util.convert_amount(122.20, "2017-03-13", "GBP", "USD", @doc))
    assert_equal(2.07, Util.convert_amount(56, "2017-03-14", "CZK", "EUR", @doc))
  end

  def test_base_currency()
    assert_equal(1, @converter.get_exchange_rate("2017-03-15", "EUR", "EUR"))
  end

  def test_date_not_existing
    assert_equal(0, @currency_converter.get_exchange_rate("2017-03-18", "GBP", "USD"))
  end

end

