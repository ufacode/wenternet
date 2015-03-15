$(function () {
  $('.plus-rating, .minus-rating').on('click', function(e){
    e.preventDefault();
    var url = $(this).data('url');
    $.post(url, function (data) {
        $('#notice').text(data.message);
    })
  });
});
