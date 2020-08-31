require 'rails_helper'

RSpec.describe RecordsController, type: :controller do

  ################################
  #⭐️controllerでのテスト対象
  #  📍Webリクエストに成功したか?
  #  📍正しいページにリダイレクトされたか
  #  📍ユーザー認証が成功したか
  #  📍レスポンスのテンプレートに正しいオブジェクトが保存されたか
  #  📍ビューに表示されたメッセージは適切か
  ################################

  describe "GET #index" do
    it "200レスポンスが返ってきているか" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "GET #new" do

  end

  describe "GET #create" do

  end

  describe "GET #show" do

  end

  describe "GET #edit" do

  end

  describe "GET #update" do

  end

  describe "GET #destroy" do
    
  end

end
