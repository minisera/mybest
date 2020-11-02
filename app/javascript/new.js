// お気に入り投稿・編集画面
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image_preview');
    
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "post_image_custom");
      
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', "post_image_pre");
      
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };
    
    document.getElementById('post_image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('.post_image_pre');
      if (imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });
  });
}

// プロフィール編集画面
if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image_preview');
    
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "user_image_custom");
      
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('class', "profile_image_pre");

      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('user_profile_image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('.profile_image_pre');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}