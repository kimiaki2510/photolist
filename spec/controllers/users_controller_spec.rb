require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  ################################
  #⭐️controllerでのテスト対象
  #  📍Webリクエストに成功したか?
  #  📍正しいページにリダイレクトされたか
  #  📍ユーザー認証が成功したか
  #  📍レスポンスのテンプレートに正しいオブジェクトが保存されたか
  #  📍ビューに表示されたメッセージは適切か
  ################################

  describe "GET #new" do
    it "200レスポンスが返ってきているか" do
      get :new
      expect(response.status).to eq 200
    end

    it "newテンプレートで表示される事" do
      get :new
      expect(response).to render_template :new
    end

    it "@userがnewされている事" do
      get :new
      expect(assigns :user).to_not be_nil
    end
  end

  describe "GET #index" do
    context "login user" do       
      it "リクエストが成功するか" do
        get :index
        expect(response.status).to eq 200
      end

      it "indexテンプレートで表示される事" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe "GET #edit" do
  end

  describe "GET #show" do
  end

  describe "GET update" do
  end

  describe "GET destroy" do
  end
end
