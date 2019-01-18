require 'rails_helper'

RSpec.describe "users/show", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before do
    assign(:user, user)
    render
  end

  describe "contains table with listed user" do

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'table')
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:name))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:email))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:admin))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:account_active))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{user.id}")
      expect(rendered).to have_selector('td', text: "#{user.name}")
      expect(rendered).to have_selector('td', text: "#{user.email}")
      expect(rendered).to have_selector('td', text: "#{user.decorate.admin_human}")
      expect(rendered).to have_selector('td', text: "#{user.decorate.active_human}")
    end

    it "contains header / footer / buttons" do
      expect(rendered).to have_selector('h1', text: I18n.t("users.show.header"))
      expect(rendered).to have_selector('h2', text: I18n.t("users.show.footer"))
      expect(rendered).to have_css("input#edit_user_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
