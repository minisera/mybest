require 'rails_helper'

RSpec.describe PostC, type: :model do
  before do
    @post_c = FactoryBot.build(:post_c)
    @post_c.image = fixture_file_upload('public/image/output-image.png')
  end

  describe '新規投稿機能、投稿編集機能' do
    context '新規投稿がうまくいくとき' do
      it "全て情報に不備がなければ登録できる" do
        expect(@post_c).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it "titleが空だと登録できない" do
        @post_c.title = ""
        @post_c.valid?
        expect(@post_c.errors.full_messages).to include("タイトルを入力してください")
      end
      it "placeが空だと登録できない" do
        @post_c.place = ""
        @post_c.valid?
        expect(@post_c.errors.full_messages).to include("出会った場所を入力してください")
      end
      it "brandが空だと登録できない" do
        @post_c.brand = ""
        @post_c.valid?
        expect(@post_c.errors.full_messages).to include("ブランドを入力してください")
      end
      it "storyが空だと登録できない" do
        @post_c.story = ""
        @post_c.valid?
        expect(@post_c.errors.full_messages).to include("出会うまでのストーリーを入力してください")
      end
      it "evidenceが空だと登録できない" do
        @post_c.evidence = ""
        @post_c.valid?
        expect(@post_c.errors.full_messages).to include("お気に入りのポイントを入力してください")
      end
    end
  end
  describe "投稿編集機能" do
    context "編集がうまくいく時" do
      
    end
    context "編集がうまく行かない時" do
    end
end
