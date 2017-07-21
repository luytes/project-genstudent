$(document).ready(function(){
  var scroll_start = 0;
  var change_color = $('#change_color');
  var offset = change_color.offset();
  if (change_color.length){
    $(document).scroll(function() {
      scroll_start = $(this).scrollTop();
      if(scroll_start > offset.top) {
        // the white normal navbar
        $("#navbar-add").removeClass("navbar-trans");
        $(".navbar-link-text").removeClass("navbar-link-white");
      } else {
        // what the users sees when he lands on the page
        $("#navbar-add").addClass("navbar-trans");
        $(".navbar-link-text").addClass("navbar-link-white");
        // $("#navbar-add").removeClass("navbar-white");
      }
    });
  }
});
