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
      expect(rendered).to have_selector('table')
      expect(rendered).to have_css("tr#user_#{user.id}")
      expect(rendered).to have_selector('td', text: "#{user.id}")
      expect(rendered).to have_selector('td', text: "#{user.name}")
      expect(rendered).to have_selector('td', text: "#{user.email}")
      expect(rendered).to have_selector('i', class: 'fas fa-search')
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
