require 'rails_helper'

RSpec.describe 'PoctCsController', type: :request do
  before do
    @post = FactoryBot.create(:post_c)
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_c_path(@post)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する' do
      get post_c_path(@post)
      expect(response.body).to include @post.title
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのブランドが存在する' do
      get post_c_path(@post)
      expect(response.body).to include @post.brand
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの出会った場所が存在する' do
      get post_c_path(@post)
      expect(response.body).to include @post.place
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの出会うまでのストーリーが存在する' do
      get post_c_path(@post)
      expect(response.body).to include @post.story
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのお気に入りポイントが存在する' do
      get post_c_path(@post)
      expect(response.body).to include @post.evidence
    end
    it 'showアクションにリクエストするとレスポンスに画像が存在する' do
      get post_c_path(@post)
      expect(response.body).to include 'test_image.png'
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get post_c_path(@post)
      expect(response.body).to include 'コメント一覧'
    end
  end
  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_cs_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する' do
      get post_cs_path
      expect(response.body).to include @post.title
    end
    it 'indexアクションにリクエストするとレスポンスに画像が存在する' do
      get post_cs_path
      expect(response.body).to include 'test_image.png'
    end
    it 'indexアクションにリクエストすると投稿者のアバターが存在する' do
      get post_cs_path
      expect(response.body).to include 'test_user.png'
    end
    it 'indexアクションにリクエストすると投稿者の名前が存在する' do
      get post_cs_path
      expect(response.body).to include @post.user.name
    end
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_cs_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する' do
      get post_cs_path
      expect(response.body).to include @post.title
    end
    it 'indexアクションにリクエストするとレスポンスに画像が存在する' do
      get post_cs_path
      expect(response.body).to include 'test_image.png'
    end
    it 'indexアクションにリクエストすると投稿者のアバターが存在する' do
      get post_cs_path
      expect(response.body).to include 'test_user.png'
    end
    it 'indexアクションにリクエストすると投稿者の名前が存在する' do
      get post_cs_path
      expect(response.body).to include @post.user.name
    end
  end

  describe 'GET #edit' do
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do
      get post_cs_path(@post)
      expect(response.status).to eq 200
    end
  end
  describe 'PUT #update' do
    it 'updateアクションにリクエストすると正常にレスポンスが返ってくる' do
      put post_c_path(@post), params: { title: '新しいタイトル' }
      expect(@post.reload.title).to eq '新しいタイトル'
    end
  end
end
