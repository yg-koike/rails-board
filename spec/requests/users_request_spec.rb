require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #show" do 
    context 'ログインしている場合' do 
      before do 
        @user = create(:user)
        allow(User).to receive(:find_by).and_return(@user)
        post login_path session: { name: 'hoge', password: 'password' } 
      end

      it 'リクエストが成功すること' do      
        get user_path @user.id 
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        get user_path @user.id 
        expect(response.body).to include "サンプルネーム"
      end 
    end

    context 'ログインしていない場合' do
      before do 
        @user = create(:user)
      end

      it 'リダイレクトされること' do 
        get user_path @user.id 
        expect(response.status).to redirect_to login_path
      end
    end  
  end 

  describe "GET #new" do 
    it 'リクエストが成功すること' do 
      get new_user_path
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do 
    context 'パラメータが正常な場合' do 
      it 'リクエストが成功すること' do 
        post users_path, params: { user: attributes_for(:user) }
        expect(response.status).to eq 302
      end

      it 'ユーザーが登録されること' do
        expect do 
          post users_path, params: { user: attributes_for(:user) }
        end.to change(User, :count).by(1)
      end

      it 'マイページにリダイレクトすること' do 
        post users_path, params: { user: attributes_for(:user) }
        expect(response).to redirect_to User.last
      end
    end

    context 'パラメータが異常な場合' do 
      it '新規登録ページにリダイレクトすること' do 
        post users_path, params: { user: attributes_for(:user, :invalid) }
        expect(response.status).to redirect_to new_user_path
      end

      it 'ユーザーが登録されないこと' do 
        expect do 
          post users_path, params: { user: attributes_for(:user, :invalid) }
        end.to_not change(User, :count)
      end

    end
  end

  describe "GET #edit" do 
    context 'ログインしている場合' do
      before do
        @user = create(:user)
        allow(User).to receive(:find_by).and_return(@user)
        post login_path session: { name: 'hoge', password: 'password' }
      end
      
      it 'リクエストが成功すること' do 
        get edit_user_path @user.id 
        expect(response.status).to eq 200
      end

      it 'ユーザー編集が表示されていること' do 
        get edit_user_path @user.id 
        expect(response.body).to include 'ユーザー編集'
      end

      it 'ユーザー名が表示されていること' do 
        get edit_user_path @user.id 
        expect(response.body).to include 'サンプルネーム'
      end
    end

    context 'ログインしていない場合' do 
      before do 
        @user = create(:user)
      end

      it 'ログインページにリダイレクトすること' do 
        get edit_user_path @user.id 
        expect(response.status).to redirect_to login_path
      end
    end
  end

  describe "PATCH #update" do 
    before do 
      @user = create(:user)
      @user_params = attributes_for(:user, user_name: "違うネーム")
      allow(User).to receive(:find_by).and_return(@user)
      post login_path session: { name: 'hoge', password: 'password' }
    end

    context 'パラメータが正常な場合' do
      it 'リクエストが成功すること' do
        patch user_path(@user), params: { id: @user.id, user: @user_params }
        expect(response.status).to eq 302
      end

      it 'ユーザー名が更新されること' do
        expect do
          patch user_path(@user), params: { id: @user.id, user: @user_params }
        end.to change { User.find(@user.id).user_name }.from("サンプルネーム").to("違うネーム")
      end

      it 'マイページにリダイレクトすること' do 
        patch user_path(@user), params: { id: @user.id, user: @user_params }
        expect(response).to redirect_to User.last
      end

    end

    context 'パラメータが異常な値の場合' do 
      it '編集ページにリダイレクトすること' do 
        patch user_path(@user), params: { id: @user.id, user: attributes_for(:user, user_name: "") }
        expect(response.status).to redirect_to edit_user_path
      end

      it 'ユーザー名が変更されないこと' do
        expect do
          patch user_path(@user), params: { id: @user.id, user: attributes_for(:user, user_name: "") }
        end.to_not change(User.find(@user.id), :user_name)
      end

    end
  end

  describe 'GET #search' do 
    
  end
end
