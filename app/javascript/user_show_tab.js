if (document.URL.match( /users/ )) {
  document.addEventListener('DOMContentLoaded', ()=>{
    const pickTab = document.querySelector("#pick_tab");
    const postTab = document.querySelector("#post_tab");
    let activeClass = document.querySelector(".active");
    let inActiveClass = document.querySelector(".inactive");
    
    pickTab.addEventListener("click",()=>{
      if(inActiveClass.className == "mypage_container inactive") {
        inActiveClass.classList.remove("inactive");
        inActiveClass.classList.add("active");
        activeClass.classList.remove("active");
        activeClass.classList.add("inactive");
      };
    });
    postTab.addEventListener("click",()=>{
      if(activeClass.className == "mypage_container inactive") {
        activeClass.classList.remove("inactive");
        activeClass.classList.add("active");
        inActiveClass.classList.remove("active");
        inActiveClass.classList.add("inactive");
        }
    });
  });
}