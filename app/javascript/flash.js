$(function(){
  $(".posts_title").click(function(){
    $(this).css("color","blue");
  });
  $(".notice,.alert").click(function(){
    $(this).fadeOut();
  });
});