var refreshRating = function () {
  $('.rating').raty({ path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
          readOnly: true,
          score: function() {
            return $(this).attr('data-score');
          }
        });
};



$(document).on('turbolinks:load', function(){
    
    refreshRating();
    //Image Constrain
    $(".img-zoom").elevateZoom({ zoomType: "lens", containLensZoom: true});
   
    //Inner Zoom
    //$(".img-zoom").elevateZoom({
     //         zoomType : "inner",
      //      cursor: "crosshair"
     // });
    //$(".img-zoom").elevateZoom({tint:true, tintColour:'#F90', tintOpacity:0.5});// if you want some bg effects
});