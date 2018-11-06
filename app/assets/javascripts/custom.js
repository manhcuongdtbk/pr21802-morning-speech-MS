$(document).ready(function () {
  // Fadeout and autoclose alert
  window.setTimeout(function() {
    $(".alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove();
    });
  }, 1000);

  // Datetimepicker
  $('.datetimepicker').datetimepicker({
    format: 'DD/MM/YYYY'
  });
});
