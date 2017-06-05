$(document).ready(function() {
  $("#btn-expand-reviews").on('click', function(){
    // show more reviews
    $('.reviews-expanded-list').show();
    $(this).hide();
  });
});
