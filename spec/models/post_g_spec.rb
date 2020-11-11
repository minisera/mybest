require 'rails_helper'

RSpec.describe PostC, type: :model do
  before do
    @post_g = FactoryBot.build(:post_g)
    @post_g.image = fixture_file_upload('public/image/output-image.png')
  end

  describe '新規投稿機能、投稿編集機能' do
    context '新規投稿がうまくいくとき' do
      it "全て情報に不備がなければ登録できる" do
        expect(@post_g).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it "titleが空だと登録できない" do
        @post_g.title = ""
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("タイトルを入力してください")
      end
      it "placeが空だと登録できない" do
        @post_g.place = ""
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("出会った場所を入力してください")
      end
      it "brandが空だと登録できない" do
        @post_g.brand = ""
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("ブランドを入力してください")
      end
      it "storyが空だと登録できない" do
        @post_g.story = ""
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("出会うまでのストーリーを入力してください")
      end
      it "storyが30文字以下では登録できない" do
        @post_g.story = "aaa"
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("出会うまでのストーリーは30文字以上で入力してください")
      end
      it "evidenceが空だと登録できない" do
        @post_g.evidence = ""
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("お気に入りのポイントを入力してください")
      end
      it "evidenceが30文字以下では登録できない" do
        @post_g.evidence = "aaa"
        @post_g.valid?
        expect(@post_g.errors.full_messages).to include("お気に入りのポイントは30文字以上で入力してください")
      end
    end
  end

end
