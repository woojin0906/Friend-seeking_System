$(function() {
  
    var N = 0;
    var K = 0;
    var tt
    
    START();

    function START() {
      tt = setInterval(NEXT, 3000);
    }

    function NEXT() {

      if( N < $('.photo-slider-img').length - 1 ) {
        N++;
      } else {
        N = 0;
      }

      CHANGE();
    }

    function CHANGE() {
      K = 1;   
      $('.photo-slider-img.NOW').stop().animate({left: '-100%'}, 500);
      $('.photo-slider-img').eq(N).stop().css({left: '100%'}).animate({left: 0}, 500, OK);
    }

    function OK() {
      K = 0;
      $('.photo-page').removeClass('active').eq(N).addClass('active');
      $('.photo-slider-img').removeClass('NOW').eq(N).addClass('NOW');
    }



    $('.photo-page').on('click', function() {

      if( $(this).index() == N || K == 1 ) return;
      
      if ( tt ) {
         clearInterval( tt );
         tt = 0;
         N = $(this).index();
         CHANGE();
         START();
       }
    });

});
