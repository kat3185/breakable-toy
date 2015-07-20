var e = document.getElementById("student_discount_current_student");

$('#new_student :checkbox').change(function() {
  var discount = e.options[e.selectedIndex].text;
  if (discount == "No") {
    var singleClass = "50";
    var doubleClass = "90";
  } else if (discount == "Yes") {
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

$('#new_student #student_discount_current_student').change(function() {
  var discount = e.options[e.selectedIndex].text;
  if (discount == "No") {
    var singleClass = "50";
    var doubleClass = "90";
  } else if (discount == "Yes") {
    var singleClass = "40";
    var doubleClass = "70";
  }
  var checkCount = $("[type='checkbox']:checked").length;
  if (checkCount < 1) {
    $( "span.running-total" ).text("0");
  } else if (checkCount == 1){
    $( "span.running-total" ).text(singleClass);
  } else {
    $( "span.running-total" ).text(doubleClass);
  }
});
