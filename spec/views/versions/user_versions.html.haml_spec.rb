require 'rails_helper'

RSpec.describe "versions/user_versions", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:version) { PaperTrail::Version.new }
  before do
    allow(view).to receive_messages(current_user: user)
    allow(version).to receive_messages(item: user)
    assign(:users, [user])
    assign(:versions, [version])
    render
  end
  describe "contains table with all versions done by specified user" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("versions.header"))
      expect(rendered).to have_selector('input', id: 'SearchInput')
    end
  end

  it "table head content" do
    expect(rendered).to have_selector('table', class: 'table', id: 'SearchableTable')
    expect(rendered).to have_selector('th', text: User.human_attribute_name(:id))
    expect(rendered).to have_selector('th', text: User.human_attribute_name(:name))
    expect(rendered).to have_selector('th', text: I18n.t("versions.action"))
    expect(rendered).to have_selector('th', text: I18n.t("versions.created_at"))
  end

  it "table body content" do
    expect(rendered).to have_selector('td', text: "#{version.item.id}")
    expect(rendered).to have_selector('td', text: "#{version.item.name}")
    expect(rendered).to have_selector('td', text: "#{version.event}")
    expect(rendered).to have_selector('td', text: "#{version.created_at}")
  end
end
