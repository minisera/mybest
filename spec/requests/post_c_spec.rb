require "rails_helper"

RSpec.describe "PoctCsController", type: :request do
  before do
    @post = FactoryBot.create(:post_c)
  end

  describe "GET #show" do
    it "showアクションにリクエストすると正常にレスポンスが返ってくる" do 
      get post_c_path(@post)
      expect(response.status).to eq 200
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する" do 
      get post_c_path(@post)
      expect(response.body).to include @post.title
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのブランドが存在する" do 
      get post_c_path(@post)
      expect(response.body).to include @post.brand
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの出会った場所が存在する" do 
      get post_c_path(@post)
      expect(response.body).to include @post.place
    end
    it "showアクションにリクエストするとレスポンスに投稿済みの出会うまでのストーリーが存在する" do 
      get post_c_path(@post)
      expect(response.body).to include @post.story
    end
    it "showアクションにリクエストするとレスポンスに投稿済みのお気に入りポイントが存在する" do 
      get post_c_path(@post)
      expect(response.body).to include @post.evidence
    end
    it "showアクションにリクエストするとレスポンスに画像が存在する" do 
      get post_c_path(@post)
      expect(response.body).to include "test_image.png"
    end
    it "showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する" do 
      get post_c_path(@post)
      expect(response.body).to include "コメント一覧"
    end
  end 

end