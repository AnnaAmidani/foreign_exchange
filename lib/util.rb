module Util module_function

  def convert_amount(ref_date, base_amount, base_currency, counter_currency, file)
    if(base_currency == counter_currency)
      return base_amount
    end
    currency_converter = CurrencyConverter.new(file)  
    exchange_rate = currency_converter.get_exchange_rate(ref_date, base_currency, counter_currency)
    return (base_amount.to_f * exchange_rate).round(2)
  end

end