$(document).ready(function(){
  var scroll_start = 0;
  var change_color = $('#change_color');
  var offset = change_color.offset();
  if (change_color.length){
    $(document).scroll(function() {
      scroll_start = $(this).scrollTop();
      if(scroll_start > offset.top) {
        $("#navbar-add").addClass("navbar-white");
        $("#navbar-add").removeClass("navbar-trans");
      } else {
        $("#navbar-add").addClass("navbar-trans");
        $("#navbar-add").removeClass("navbar-white");
      }
    });
  }
});
