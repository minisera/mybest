# coding: utf-8

password = "password"
[
  ["test1@test.com", 'ルヒ', "test_1", password],
  ["test2@test.com", 'ショッパー', "test_2", password],
  ["test3@test.com", 'ナギ', "test_3", password]
].each do |mail, name, img, pass|
  User.create!(
    { email: mail, name: name, password: pass, password_confirmation: pass, profile: "よろしくお願い致します。" }
  ).profile_image.attach(io: File.open("./public/image/user_image/#{img}.jpg"), filename: "#{img}.jpg", content_type: 'image/jpg')
end

# 衣類初期データ
User.all.each do |user|
  posts = [
            ["エアリズムTシャツ","UNIQLO渋谷店","UNIQLO","ダボッとした肌触りの良い服を探していました。友人に勧められ購入しました。","表はコットンで裏はエアリズム。よくあるスポーツTシャツみたいにテロテロした生地感ではなく、表は本当にコットン似です。表裏違う生地を貼り合わせてある訳では無さそうなのに不思議です…。素晴らしいハイブリッド！自分は4枚買って着回しています。","test_1"],
            ["ジョガーパンツ","GU焼津店","GU","スキニーパンツを愛用していたのですが夏場は少し暑かったので今年は,ゆったり履け、足首が隠れる丈が欲しかったのでこちらを購入しました。","いわゆるトラックジャージの少しキレイ目にも使える感じです。コーディネートしやすいです！","test_2"],
            ["黒スニーカー","ABCマート島田店","CONVERSE","ズボンが黒なので、黒色のスニーカーが欲しく購入しました。スッキリ見せたいので細身のタイプを選びました","予想通り黒のパンツと相性が良いです！旅行にも履いていきましたが、全く足がつかれることなく過ごせました。自慢の一品です。","test_3"],
            ["ライトダウン","BEAMS","mont-bell","汎用性のあるインナーダウンを探していました。コートの下に着ることでコートを長く着たかったためです。","めちゃめちゃ軽くて本当に来ているのか疑います。「あれ？今俺ダウン着てる？」ってなります。大丈夫です。ちゃんと着れてます。12月上旬まではこれを羽織るだけでも十分暖かいです。それ以降はインナーで大活躍間違いなし。","test_4"],
            ["黒長袖インナー","無印良品静岡店","無印良品","自分が静電気に悩まされているので、化学繊維が含まれていないインナーを探していました。","一言でいうと最強の下着です。日本中の全紳士はこれを着たほうが良い。全く静電気が無いのはもちろん、とっても温かいです。ヒートテックばかり着ていましたが、それに匹敵するぐらいです。おすすめできます。","test_5"]
          ]
  posts.shuffle.each do |title, place, brand, story, evidence,img|
  post = user.post_cs.new(
    {title: title,place: place,brand: brand,story: story,evidence: evidence}
  )
  post.image.attach(io: File.open("./public/image/post_c_image/#{img}.jpg"), filename: "#{img}.jpg", content_type: 'image/jpg')
  post.save
  end
end

# 本初期データ
User.all.each do |user|
  posts = [
            ["嫌われる勇気","Amazon","岸見一郎","周りの意見を気にしすぎて息苦いさを感じていた時に、Amazonでふと手にとってみました。","この本で印象的だった学びは「課題の分離」です。今まで相手の課題を解決しようと苦しんでいました。そこで課題を分離して自分の課題を集中することができました。そうすることで自ずと自分のやりたいことが見えてきました。","test_1"],
            ["はたらくきほん100","Amazon","松浦弥太郎 野尻哲也","仕事の基礎となる指針となる考えを探していました。「仕事をもっとやりがいのあるものにしたい！」と当時悩んでおり、手にとったのがこの本です。","1ページに1テーマ、仕事の指針についてまとめられている。自分が印象的だったのは「目の前の課題にどれだけ情熱を持てるかが大切です。」という一節です。今が見えなくなっていた自分を、ハッと気づかせてくれました。","test_2"],
            ["君の膵臓を食べたい","戸田書店焼津店","住野よる","映画をみて原作も気になりました。映画で消化不十分になった分もっと理解したいと思い手にとってみました。","『偶然なんかじゃない。君が選択してきたんだよ』その言葉がすごく残りました。2人のやり取りも、選ばれる言葉も、切ないぐらいに心地よい空気感です。映画も良かったけど、この物語は、改めて本で読んで良かったです。","test_3"]
          ]
  posts.shuffle.each do |title, place, brand, story, evidence,img|
  post = user.post_bs.new(
    {title: title,place: place,brand: brand,story: story,evidence: evidence}
  )
  post.image.attach(io: File.open("./public/image/post_b_image/#{img}.jpg"), filename: "#{img}.jpg", content_type: 'image/jpg')
  post.save
  end
end

# 雑貨初期データ
User.all.each do |user|
  posts = [
            ["小さい財布","abrAsus公式ページ","abrAsus","普段の支払い方法は大方キャッシュレスで、小銭やお札を使うことがないため大きな財布は持て余していました。そこで最小限のものが入る小さい財布を探していました。","・小さくポケットでかさばらない  ・カードが財布を開かなくても取り出せる  ・カードが最大５枚しか入らないのでカードを見直すきっかけになる。","test_1"],
            ["G-shock時計","Amazon","G-shock","仕事で時間を測る機会があり、ストップウォッチ付きの腕時計を探していました。更に水に濡れても、強い衝撃を与えても大丈夫なものを選びました。","衝撃に強く、ストップウォッチ付きなので職場で大活躍しました。黒色のため普段のコーディネートにも最適です。","test_2"],
            ["黒バックパック","メルカリ","MOLESKINE","通勤で使用するため耐水性のあるリュックを探していました。また、パソコンが入るようなポッケがあるものを選びました。","四角いフォルムが可愛く、通勤以外にも使っています。耐水性があるため土砂降りの中を傘をささずに行っても大丈夫です。（そのぐらい水を弾くという意味で実際はさしてください）","test_3"]
          ]
  posts.shuffle.each do |title, place, brand, story, evidence,img|
  post = user.post_gs.new(
    {title: title,place: place,brand: brand,story: story,evidence: evidence}
  )
  post.image.attach(io: File.open("./public/image/post_g_image/#{img}.jpg"), filename: "#{img}.jpg", content_type: 'image/jpg')
  post.save
  end
end
