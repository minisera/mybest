require 'rails_helper'

RSpec.describe PostB, type: :model do
  before do
    @post_b = FactoryBot.build(:post_b)
  end

  describe '新規投稿機能、投稿編集機能' do
    context '新規投稿がうまくいくとき' do
      it "全て情報に不備がなければ登録できる" do
        expect(@post_b).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it "titleが空だと登録できない" do
        @post_b.title = ""
        @post_b.valid?
        expect(@post_b.errors.full_messages).to include("タイトルを入力してください")
      end
      it "placeが空だと登録できない" do
        @post_b.place = ""
        @post_b.valid?
        expect(@post_b.errors.full_messages).to include("出会った場所を入力してください")
      end
      it "storyが30文字以下では登録できない" do
        @post_b.story = "aaa"
        @post_b.valid?
        expect(@post_b.errors.full_messages).to include("出会うまでのストーリーは30文字以上で入力してください")
      end
      it "evidenceが空だと登録できない" do
        @post_b.evidence = ""
        @post_b.valid?
        expect(@post_b.errors.full_messages).to include("お気に入りのポイントを入力してください")
      end
      it "evidenceが30文字以下では登録できない" do
        @post_b.evidence = "aaa"
        @post_b.valid?
        expect(@post_b.errors.full_messages).to include("お気に入りのポイントは30文字以上で入力してください")
      end
    end
  end

end