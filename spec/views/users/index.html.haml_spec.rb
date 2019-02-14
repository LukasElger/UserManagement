require 'rails_helper'

RSpec.describe "users/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before do
    users = [user]
    elements = Kaminari.paginate_array(users).page(1)
    assign(:users, elements)
    render
  end

  describe "contains table with all users" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.users.index.header"))
      expect(rendered).to have_selector('input', id: 'SearchInput')
    end

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'default', id: 'SearchableTable')
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:name))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:email))
      expect(rendered).to have_selector('th', text: User.human_attribute_name(:account_active))
      expect(rendered).to have_selector('th', text: I18n.t("actions.show"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.edit"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.delete"))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{user.id}")
      expect(rendered).to have_selector('td', text: "#{user.name}")
      expect(rendered).to have_selector('td', text: "#{user.email}")
      expect(rendered).to have_selector('td', text: "#{user.decorate.active_human}")
      expect(rendered).to have_selector('i', class: 'fas fa-search')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-trash-alt')
    end
  end
end
