$(document).on('turbolinks:load', function(){
  $('#slider').slick({
    auto: true,
    pause: 5000,
    accessibility: true,
    autoplaySpeed: 3000,
    dots: true,
  });
});

