require 'rails_helper'

RSpec.describe "contur/servers/index", type: :view do
  let(:server) { FactoryBot.create(:contur_server) }
  before do
    servers = [server]
    elements = Kaminari.paginate_array(servers).page(1)
    assign(:servers, elements)
    render
  end

  describe "contains table with all servers" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/servers.index.header"))
    end

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'default')
      expect(rendered).to have_selector('th', text: Contur::Server.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: Contur::Server.human_attribute_name(:os_version))
      expect(rendered).to have_selector('th', text: Contur::Server.human_attribute_name(:ruby_version))
      expect(rendered).to have_selector('th', text: Contur::Server.human_attribute_name(:admin_user))
      expect(rendered).to have_selector('th', text: Contur::Server.human_attribute_name(:access_type))
      expect(rendered).to have_selector('th', text: I18n.t("actions.actions"))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{server.id}")
      expect(rendered).to have_selector('i', class: 'fas fa-search')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-trash-alt')
    end
  end
end
