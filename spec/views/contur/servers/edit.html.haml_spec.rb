require 'rails_helper'

RSpec.describe "contur/servers/edit", type: :view do
  before do
    assign(:server, FactoryBot.create(:contur_server))
    render
  end

  describe "contains a edit form for a server" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/servers.edit.header"))
      expect(rendered).to have_selector('form', class: 'simple_form edit_contur_server')
    end
    it "edit form content" do
      assert_select "form" do
        assert_select "input[name='contur_server[os_version]']"
        assert_select "input[name='contur_server[nginx_version]']"
        assert_select "input[name='contur_server[hostname]']"
        assert_select "input[name='contur_server[access_type]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains footer / buttons" do
      expect(rendered).to have_selector('h2', text: I18n.t("views.contur/servers.edit.footer"))
      expect(rendered).to have_css("input#delete_server_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
