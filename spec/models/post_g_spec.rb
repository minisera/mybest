require 'rails_helper'

RSpec.describe PostC, type: :model do
  before do
    @post = FactoryBot.build(:post_g)
  end

  describe '新規投稿機能、投稿編集機能' do
    context '新規投稿がうまくいくとき' do
      it '全て情報に不備がなければ登録できる' do
        expect(@post).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'placeが空だと登録できない' do
        @post.place = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('出会った場所を入力してください')
      end
      it 'brandが空だと登録できない' do
        @post.brand = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('ブランドを入力してください')
      end
      it 'storyが空だと登録できない' do
        @post.story = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('出会うまでのストーリーを入力してください')
      end
      it 'storyが30文字以下では登録できない' do
        @post.story = 'aaa'
        @post.valid?
        expect(@post.errors.full_messages).to include('出会うまでのストーリーは30文字以上で入力してください')
      end
      it 'evidenceが空だと登録できない' do
        @post.evidence = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('お気に入りのポイントを入力してください')
      end
      it 'evidenceが30文字以下では登録できない' do
        @post.evidence = 'aaa'
        @post.valid?
        expect(@post.errors.full_messages).to include('お気に入りのポイントは30文字以上で入力してください')
      end
    end
  end
end
