window.addEventListener("load",function(){
  // ヘッダー投稿アイコン
  const pullDownButtonEdit = document.querySelector("#edit_list")
  const pullDownEdit = document.querySelector("#pulldown_edit")
  // ヘッダーユーザーアイコン
  const pullDownButtonImage = document.querySelector("#image_list")
  const pullDownImage = document.querySelector("#pulldown_image")
  
  // 投稿アイコンホバー時色変化
  pullDownButtonEdit.addEventListener("mouseover",function(){
    this.setAttribute("style", "color:#aaa;")
  })
  pullDownButtonEdit.addEventListener("mouseout",function(){
    this.setAttribute("style", "color:black;")
  })
  // ユーザーアイコンホバー時色変化
  pullDownButtonImage.addEventListener("mouseover",function(){
    this.setAttribute("style", "filter:opacity(50%);")
  })
  pullDownButtonImage.addEventListener("mouseout",function(){
    this.removeAttribute("style", "filter:opacity(50%);")
  })
  
  // 投稿アイコンクリック時投稿リスト出現
  pullDownButtonEdit.addEventListener("click",function(){
    if (pullDownEdit.getAttribute("style") == "display:block;") {
      pullDownEdit.removeAttribute("style", "display:block;");
      pullDownImage.removeAttribute("style", "display:block;");
    } else {
      pullDownEdit.setAttribute("style", "display:block;")
      pullDownImage.removeAttribute("style", "display:block;")
    }
  })
  // ユーザーアイコンクリック時ユーザーリスト出現
  pullDownButtonImage.addEventListener("click",function(){
    if (pullDownImage.getAttribute("style") == "display:block;") {
      pullDownImage.removeAttribute("style", "display:block;")
      pullDownEdit.removeAttribute("style", "display:block;")
    } else {
      pullDownImage.setAttribute("style", "display:block;")
      pullDownEdit.removeAttribute("style", "display:block;")
    }
  })
})