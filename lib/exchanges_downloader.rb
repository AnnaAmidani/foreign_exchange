require 'open-uri'
require_relative 'constants'

exchange_rates = open(Constants::TEST_RATES_URL)
IO.copy_stream(exchange_rates, Constants::EXCHANGE_RATES_FILE)
