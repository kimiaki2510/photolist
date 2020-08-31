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
  end

  describe "GET #index" do
    context "login user" do
      let(:users) { FactoryBot.create_list :user,2 }

    end
    context "no login user" do
    end
  end

  describe "GET #edit" do
    context "login user" do
    end
    context "no login user" do
    end
  end

  describe "GET #show" do
    context "login user" do
    end
    context "no login user" do
    end
  end

  describe "GET update" do
    context "login user" do
    end
    context "no login user" do
    end
  end

  describe "GET destroy" do
    context "login user" do
    end
    context "no login user" do
    end
  end
end
