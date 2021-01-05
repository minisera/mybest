// お気に入り投稿・編集画面
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image_preview');
    
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "image_custom");
      
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      if (document.URL.match( /users/ )){
        blobImage.setAttribute('class', "profile_image_pre");
      } else {
        blobImage.setAttribute('class', "post_image_pre");
      };
      
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    
    document.getElementById('in_image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const userImageContent = document.querySelector('.profile_image_pre');
      const postImageContent = document.querySelector('.post_image_pre');

      if (userImageContent){
        userImageContent.remove();
      } else {
        postImageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });

    
  });
}