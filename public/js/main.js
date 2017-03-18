$( document ).ready(function() {
  $("#ref_date").datepicker({ minDate: "-89D", maxDate: 0, defaultDate: 0, dateFormat: "yy-mm-dd" });
  
  $(getCurrenciesList()).each(function() {
  	curr = this.val;
	$("#base_currency").append($("<option>").attr('value',curr).text(curr));
	$("#counter_currency").append($("<option>").attr('value',curr).text(curr));
  });
});


function validateInline() {
  if($("#ref_date").val() === '') {
    $(".outcome").html("<span>Please select a reference date for the rate exchange.</span>");
    return false;
  }
  else if($("#amount").val() === '') {
    $(".outcome").html("<span>Please input the amount to convert.</span>");
    return false;
  }
  else {
    $("#convert").submit();
  }
}


function getCurrenciesList() {
  var currencies = [
	{val:'USD'},
	{val:'EUR'},
	{val:'JPY'},
	{val:'BGN'},
	{val:'CZK'},
	{val:'DKK'},
	{val:'GBP'},
	{val:'HUF'},
	{val:'PLN'},
	{val:'RON'},
	{val:'SEK'},
	{val:'CHF'},
	{val:'NOK'},
	{val:'HRK'},
	{val:'RUB'},
	{val:'TRY'},
	{val:'AUD'},
	{val:'BRL'},
	{val:'CAD'},
	{val:'CNY'},
	{val:'HKD'},
	{val:'IDR'},
	{val:'ILS'},
	{val:'INR'},
	{val:'KRW'},
	{val:'MXN'},
	{val:'MYR'},
	{val:'NZD'},
	{val:'PHP'},
	{val:'SGD'},
	{val:'THB'},
	{val:'ZAR'}
  ];
  return currencies;
}

            