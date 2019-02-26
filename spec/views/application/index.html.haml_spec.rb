require 'rails_helper'

RSpec.describe "application/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before do
    assign(:users, [user])
    allow(view).to receive_messages(current_user: user)
  end

  describe "not signed in view" do
    before do
      allow(view).to receive_messages(user_signed_in?: false)
      render
    end

    it "contains welcome header" do
      expect(rendered).to have_selector('h1')
    end
  end

  describe "signed in view as admin" do
    before do
      allow(view).to receive_messages(user_signed_in?: true)
      allow(user).to receive_messages(admin?: true)
      render
    end

    it "contains table with recent users" do
        expect(rendered).to have_selector('h1', text: '//TODO new dashboard')
    end
  end

  describe "signed in view as default" do
    before do
      allow(view).to receive_messages(user_signed_in?: true)
      allow(user).to receive_messages(admin?: false)
      render
    end

    it "contains welcome header" do
      expect(rendered).to have_selector('h1')
    end
  end
end
