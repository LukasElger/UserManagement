require 'rails_helper'

RSpec.describe "layouts/application", type: :view do
  let(:user) { FactoryBot.create(:user) }
  before do
    allow(view).to receive_messages(current_user: user)
  end

  describe "page content when logged in as admin" do
    before do
      allow(view).to receive_messages(user_signed_in?: true)
      allow(user).to receive_messages(admin?: true)
      render
    end
    it "renders html" do
      expect(rendered).to have_selector('html')
      expect(rendered).to have_title(I18n.t("general.title"))
      expect(rendered).to have_selector('div', class: 'overlay')
      expect(rendered).to have_selector('body')
    end

    it "renders top nav" do
      expect(rendered).to have_selector('nav', class: 'navbar navbar-expand-lg navbar-light bg-light')
      expect(rendered).to have_selector('div', class: 'container-fluid')
      expect(rendered).to have_selector('button', id: 'sidebarCollapse', class: 'btn btn-light')
      expect(rendered).to have_selector('i', class: 'fas fa-bars fa-2x')
    end

    it "renders sidebar" do
      expect(rendered).to have_selector('nav', id: 'sidebar')
      expect(rendered).to have_selector('div', id: 'dismiss')
      expect(rendered).to have_selector('i', class: 'fas fa-arrow-left')
      expect(rendered).to have_selector('div', class: 'sidebar-header')
      expect(rendered).to have_selector('h3', text: 'UserManagement')
      expect(rendered).to have_selector('ul', class: 'list-unstyled components')
      expect(rendered).to have_selector('li')
      expect(rendered).to have_selector('i', class: 'fas fa-home')
      expect(rendered).to have_selector('a', id: 'lists-data-toggle')
      expect(rendered).to have_selector('ul', id: 'listsSubmenu', class: 'collapse list-unstyled')
      expect(rendered).to have_selector('i', class: 'fas fa-user')
      expect(rendered).to have_selector('i', class: 'fas fa-code-branch')
      expect(rendered).to have_selector('i', class: 'fas fa-database')
      expect(rendered).to have_selector('a', id: 'acc-data-toggle')
      expect(rendered).to have_selector('ul', id: 'accSubmenu', class: 'collapse list-unstyled')
      expect(rendered).to have_selector('i', class: 'fas fa-info')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-toolbox')
      expect(rendered).to have_selector('i', class: 'fas fa-sign-out-alt')
    end
  end

  describe "page content when logged in as !admin" do
    before do
      allow(view).to receive_messages(user_signed_in?: true)
      allow(user).to receive_messages(admin?: false)
      render
    end
    it "renders html" do
      expect(rendered).to have_selector('html')
      expect(rendered).to have_title(I18n.t("general.title"))
      expect(rendered).to have_selector('div', class: 'overlay')
      expect(rendered).to have_selector('body')
    end

    it "renders top nav" do
      expect(rendered).to have_selector('nav', class: 'navbar navbar-expand-lg navbar-light bg-light')
      expect(rendered).to have_selector('div', class: 'container-fluid')
      expect(rendered).to have_selector('button', id: 'sidebarCollapse', class: 'btn btn-light')
      expect(rendered).to have_selector('i', class: 'fas fa-bars fa-2x')
    end

    it "renders sidebar" do
      expect(rendered).to have_selector('nav', id: 'sidebar')
      expect(rendered).to have_selector('div', id: 'dismiss')
      expect(rendered).to have_selector('i', class: 'fas fa-arrow-left')
      expect(rendered).to have_selector('div', class: 'sidebar-header')
      expect(rendered).to have_selector('h3', text: 'UserManagement')
      expect(rendered).to have_selector('ul', class: 'list-unstyled components')
      expect(rendered).to have_selector('li')
      expect(rendered).to have_selector('i', class: 'fas fa-info')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-sign-out-alt')
    end
  end

  describe "page content when !logged in" do
    before do
      allow(view).to receive_messages(user_signed_in?: false)
      render
    end
    it "renders html" do
      expect(rendered).to have_selector('html')
      expect(rendered).to have_title(I18n.t("general.title"))
      expect(rendered).to have_selector('div', class: 'overlay')
      expect(rendered).to have_selector('body')
    end
  end
end
