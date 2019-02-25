require 'rails_helper'

RSpec.describe "contur/servers/show", type: :view do
  let(:server) { FactoryBot.create(:contur_server) }
  before do
    assign(:server, server)
    render
  end

  describe "contains table with listed server" do

    it "card_block headers" do
      expect(rendered).to have_selector('div', class: 'card_block')
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:os_version))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:ruby_version))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:nginx_version))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:postgres_version))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:hostname))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:admin_user))
      expect(rendered).to have_selector('dt', text: Contur::Server.human_attribute_name(:access_type))
    end

    it "card_block content" do
      expect(rendered).to have_selector('dd', text: "#{server.os_version}")
      expect(rendered).to have_selector('dd', text: "#{server.ruby_version}")
      expect(rendered).to have_selector('dd', text: "#{server.nginx_version}")
      expect(rendered).to have_selector('dd', text: "#{server.postgres_version}")
      expect(rendered).to have_selector('dd', text: "#{server.hostname}")
      expect(rendered).to have_selector('dd', text: "#{server.admin_user}")
      expect(rendered).to have_selector('dd', text: "#{server.access_type}")
    end

    it "contains header / footer / buttons" do
      expect(rendered).to have_selector('h1', text: "#{I18n.t("views.contur/servers.show.header", model: server.hostname)}")
      expect(rendered).to have_css("input#edit_server_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
