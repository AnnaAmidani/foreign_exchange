class Constants
  TEST_RATES_URL="http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"
  PROD_RATES_URL="http://finance.yahoo.com/d/quotes.xml"
  EXCHANGE_RATES_FILE="exchange_rates.xml"
  def show
    puts "#{TEST_RATES_URL} #{PROD_RATES_URL} #{EXCHANGE_RATES_FILE}"
  end
end