$(function(){
  $(".comment_btn").click(function(e){
    const XHR = new XMLHttpRequest();
    XHR.open("POST","/posts",true);
  });
});