require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができる時' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ボタンが有る
      expect(page).to have_content('新規登録')
      # 新規套路ページに移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user_name', with: @user.name
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_comfirmation', with: @user.password_confirmation
      # 新規登録ボタンを押してユーザーモデルが１カウント増える
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # 投稿一覧に移動する
      expect(current_path).to eq posts_path
      # ログインボタン、新規登録ボタンが表示されない
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end
  context 'ユーザー新規登録ができない時' do
    it '誤った情報を入力するとユーザー新規登録ができず新規投稿ページに戻ってくる' do
    end
  end
end
