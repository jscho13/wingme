$(document).ready(function(){
  var $grid = $('.grid').imagesLoaded( function() {
    // init Masonry after all images have loaded
    $grid.masonry({
      itemSelector: '.grid-item',
      columnWidth: 1,
      "gutter": 15
    });
  });
})
