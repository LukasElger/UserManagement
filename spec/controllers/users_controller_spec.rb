require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  login_admin

  let(:current_user){ stub_model(User, locale: "de", admin?: true) }

  before do
    allow(controller).to receive(:current_user){ current_user }
  end

  describe "#new" do
    let(:user){ double }

    before(:each) do
      allow(User).to receive(:new){ user }
    end

    it "object should be initialized" do
      expect(User).to receive(:new)
      get :new
    end

    it "assigns right user to @user" do
      get :new
      expect(assigns(:user)).to eq(user)
    end

    it "renders new html" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "#index" do
    let(:users){ double }

    before(:each) do
      allow(User).to receive(:order){ users }
      allow(users).to receive(:page){ users }
    end

    it "object should be fetched" do
      expect(User).to receive(:order)
      get :index
    end

    it "assigns @users" do
      get :index
      expect(assigns[:users]).to eq(users)
    end

    it "renders index html" do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe "#show" do
    let(:user){ double }

    before(:each) do
      allow(User).to receive(:find).with("1"){ user }
    end

    it "object should be fetched" do
      expect(User).to receive(:find).with("1")
      get :show, params: {id: 1}
    end

    it "assigns @user" do
      get :show, params: {id: 1}
      expect(assigns[:user]).to eq(user)
    end

    it "renders show html" do
      get :show, params: {id: 1}
      expect(response).to render_template('show')
    end
  end

  describe "#edit" do
    let(:user){ double }

    before(:each) do
      allow(User).to receive(:find).with("1"){ user }
    end

    it "object should be fetched" do
      expect(User).to receive(:find).with("1")
      get :edit, params: {id: 1}
    end

    it "assigns @user" do
      get :edit, params: {id: 1}
      expect(assigns[:user]).to eq(user)
    end

    it "renders edit html" do
      get :edit, params: {id: 1}
      expect(response).to render_template('edit')
    end
  end

  describe "#edit_profile" do
    it "assigns @user" do
      get :edit_profile
      expect(assigns[:user]).to eq(current_user)
    end

    it "renders edit_profile html" do
      get :edit_profile
      expect(response).to render_template('edit_profile')
    end
  end

  describe "#create" do
    let(:user) { double }
    let(:attributes) { {name: "test"} }
    let(:store_att) { {user: attributes} }
    let(:post_action) { post :create, params: {user: attributes} }

    before(:each) do
      allow(User).to receive(:new){ user }
    end

    context "success" do
      before(:each) do
        allow(user).to receive(:save){ true }
      end

      it "object should be saved" do
        expect(user).to receive(:save)
        post_action
      end

      it "redirects to index" do
        post_action
        expect(response).to redirect_to(users_path)
      end

      it "assings success flash" do
        post_action
        is_expected.to set_flash[:success].to(I18n.t("flash.created", model: User.model_name.human, count: 1))
      end

      it "assigns @user" do
        post_action
        expect(assigns[:user]).to eq(user)
      end
    end

    context "failure" do
      before(:each) do
        allow(user).to receive(:save){ false }
      end

      it "renders new template" do
        post_action
        expect(response).to render_template('new')
      end
    end
  end

  describe "#update" do
    let(:user) { double }
    let(:attributes) { {name: "test"} }
    let(:store_att) { {user: attributes} }
    let(:update_action) { put :update, params: {user: attributes, id: 1}}

    before(:each) do
      allow(User).to receive(:find).with("1"){ user }
    end

    context "success" do
      before(:each) do
        allow(user).to receive(:update_user_data){ true }
      end

      it "object should be saved" do
        expect(user).to receive(:update_user_data)
        update_action
      end

      it "redirects to index" do
        update_action
        expect(response).to redirect_to(users_path)
      end

      it "assings success flash" do
        update_action
        is_expected.to set_flash[:success].to(I18n.t("flash.update", model: User.model_name.human, count: 1))
      end

      it "assigns @user" do
        update_action
        expect(assigns[:user]).to eq(user)
      end
    end

    context "failure" do
      before(:each) do
        allow(user).to receive(:update_user_data){ false }
      end

      it "renders edit template" do
        update_action
        expect(response).to render_template('edit')
      end
    end
  end

  describe "#update_profile" do
    let(:attributes) { {name: "test"} }
    let(:update_action) { put :update_profile, params: {user: attributes}}

    context "success" do
      before(:each) do
        allow(current_user).to receive(:update_with_password){ true }
      end

      it "object should be saved" do
        expect(current_user).to receive(:update_with_password)
        update_action
      end

      it "redirects to home" do
        update_action
        expect(response).to redirect_to(root_path)
      end

      it "assings success flash" do
        update_action
        is_expected.to set_flash[:success].to(I18n.t("flash.update", model: User.model_name.human, count: 1))
      end

      it "assigns @user" do
        update_action
        expect(assigns[:user]).to eq(current_user)
      end
    end

    context "failure" do
      before(:each) do
        allow(current_user).to receive(:update_with_password){ false }
      end

      it "renders edit_profile template" do
        update_action
        expect(response).to render_template('edit_profile')
      end
    end
  end
end
