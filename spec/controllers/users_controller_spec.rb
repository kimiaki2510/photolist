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


########################new######################
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

  ########################create######################
    describe "POST #create" do
      context "リクエストが成功" do
        it "302レスポンスが返ってきているか" do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
          expect(response.status).to eq 302
        end

        it 'ユーザーが登録されること' do
          expect do
            post :create, params: { user: FactoryBot.attributes_for(:user) }
          end.to change(User, :count).by(1)
        end

        it 'リダイレクトすること' do
          post :create, params: { user: FactoryBot.attributes_for(:user) }
          expect(response).to redirect_to User.last
        end
      end
    end


########################index######################
  describe "GET #index" do
    context "user login" do

      let(:user){FactoryBot.create(:user)}
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
      end

      it "ユーザー作成が有効であるか" do
        user.valid?
        expect(user).to be_valid
      end

      it "200レスポンスが返ってきているか" do
        get :index
        expect(response.status).to eq 200
      end

      it "indexテンプレートで表示される事" do
        get :index
        expect(response).to render_template :index
      end
    end

    context "no user" do
      it "302レスポンスが返ってきているか" do
        get :index
        expect(response.status).to eq 302
      end
    end
  end

########################show######################

  describe "GET #show" do
    context "user login" do

      let(:user){FactoryBot.create(:user)}
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
      end

      it "ユーザー作成が有効であるか" do
        user.valid?
        expect(user).to be_valid
      end

      it "200レスポンスが返ってきているか" do
        get :show, params: {id: user}
        expect(response.status).to eq 200
      end

      it "indexテンプレートで表示される事" do
        get :show, params: {id: user}
        expect(response).to render_template :show
      end
    end

  end

########################edit######################
  describe "GET #edit" do
    context "user login" do

      let(:user){FactoryBot.create(:user)}
      before do
        allow_any_instance_of(ApplicationController).to receive(:current_user) { user }
      end

      it "ユーザー作成が有効であるか" do
        user.valid?
        expect(user).to be_valid
      end

      it "200レスポンスが返ってきているか" do
        get :edit, params: {id: user}
        expect(response.status).to eq 200
      end

      it "indexテンプレートで表示される事" do
        get :edit, params: {id: user}
        expect(response).to render_template :edit
      end
    end
  end
########################update######################
  describe "POST update" do
  end

########################destory######################
  describe "GET destroy" do
  end
end
