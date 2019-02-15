require 'rails_helper'

RSpec.describe VersionsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:version) { PaperTrail::Version.new }
  before do
    allow(view).to receive_messages(current_user: user)
    allow(version).to receive_messages(item: user)
    versions = [version]
    versions = Kaminari.paginate_array(versions).page(1)
    assign(:users, [user])
    assign(:versions, versions)
  end

  describe "#index" do
    before do
      allow(PaperTrail::Version).to receive(:where).with(item_type: "User") { versions }
    end

    it "assigns @versions" do
      get :index, params: {item_type: User}
      expect(assigns[:versions]).to eq(versions)
    end

    it "renders index html" do
      get :index, params: {item_type: User}
      expect(response).to render_template('index')
    end

    context "with item id" do
      before do
        allow(versions).to receive(:where).with(item_id: "1") { versions }
      end

      it "assigns @versions" do
        get :index, params: {item_type: User, item_id: 1}
        expect(assigns[:versions]).to eq(versions)
      end

      it "assigns @item_id" do
        get :index, params: {item_type: User, item_id: 1}
        expect(assigns[:item_id]).to eq("1")
      end
    end
  end

  describe "#user_versions" do
    let(:versions){ double }

    before do
      allow(PaperTrail::Version).to receive(:where).with(whodunnit: "1") { versions }
    end

    it "renders user_versions html" do
      get :user_versions, params: {whodunnit: "1"}
      expect(response).to render_template('user_versions')
    end

    it "assigns @versions" do
      get :user_versions, params: {whodunnit: "1"}
      expect(assigns[:versions]).to eq(versions)
    end
  end
end
