jQuery(document).ready(function($) {
  $("#avatar").change(function() {
    $(this).parent().submit()
  });
});
