require 'rails_helper'

RSpec.describe "contur/servers/new", type: :view do
  before do
    assign(:server, Contur::Server.new)
    render
  end

  describe "contains an creation form for a server" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/servers.new.header"))
      expect(rendered).to have_selector('form', class: 'simple_form new_contur_server')
    end
    it "new form content" do
      assert_select "form" do
        assert_select "input[name='contur_server[os_version]']"
        assert_select "input[name='contur_server[ruby_version]']"
        assert_select "input[name='contur_server[nginx_version]']"
        assert_select "input[name='contur_server[postgres_version]']"
        assert_select "input[name='contur_server[hostname]']"
        assert_select "input[name='contur_server[admin_user]']"
        assert_select "input[name='contur_server[access_type]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains buttons" do
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
