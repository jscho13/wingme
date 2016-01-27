$(function(){ $(document).foundation(); });

$(document).ready(function(){
  var $grid = $('.grid').imagesLoaded( function() {
    // init Masonry after all images have loaded
    $grid.masonry({
      itemSelector: '.grid-item',
      columnWidth: 1
    });
  });
})

$(document).ready(function(){
  $(function(){
      var blue = $(document.body);

      Hammer(blue).on("swiperight", function() {
        $("button.menu-icon").trigger("click")
      });

  })
})
