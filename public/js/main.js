$( document ).ready(function() {
  $("#ref_date").datepicker({ minDate: "-89D", maxDate: 0, defaultDate: 0, dateFormat: "yy-mm-dd" });
});
function validateInline() {
  if($("#ref_date").val() === '') {
    $(".outcome").html("<span>Please select a reference date for the rate exchange.</span>");
    return false;
  }
  if($("#amount").val() === '') {
    $(".outcome").html("<span>Please input the amount to convert.</span>");
    return false;
  }
  $("#convert").submit();
}            