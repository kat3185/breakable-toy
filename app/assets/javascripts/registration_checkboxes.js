var e = document.getElementById("student_discount_current_student");

$('#new_student :checkbox').change(function() {
  var discount = e.checked;
  if (discount === false) {
    var singleClass = "50";
    var doubleClass = "90";
  } else if (discount === true) {
    var singleClass = "40";
    var doubleClass = "70";
  }
  var checkCount = $("[type='checkbox']:checked").length;
  if (checkCount < 1){
    $( "span.running-total" ).text("0");
  } else if (checkCount == 1){
    $( "span.running-total" ).text(singleClass);
  } else {
    $( "span.running-total" ).text(doubleClass);
  }
});
