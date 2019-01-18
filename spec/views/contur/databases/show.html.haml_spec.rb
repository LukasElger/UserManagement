require 'rails_helper'

RSpec.describe "contur/databases/show", type: :view do
  let(:db) { FactoryBot.create(:contur_database) }
  before do
    assign(:db, db)
    render
  end

  describe "contains table with listed database" do

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'table')
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:url))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:vm_username))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:github_branch))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:contur_type))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:service_id))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:starts_at))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:ends_at))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{db.url}")
      expect(rendered).to have_selector('td', text: "#{db.vm_username}")
      expect(rendered).to have_selector('td', text: "#{db.github_branch}")
      expect(rendered).to have_selector('td', text: "#{db.contur_type}")
      expect(rendered).to have_selector('td', text: "#{db.service_id}")
      expect(rendered).to have_selector('td', text: "#{db.starts_at}")
      expect(rendered).to have_selector('td', text: "#{db.ends_at}")
    end

    it "contains header / footer / buttons" do
      expect(rendered).to have_selector('h1', text: I18n.t("contur/database.show.header"))
      expect(rendered).to have_selector('h2', text: I18n.t("contur/database.show.footer"))
      expect(rendered).to have_css("input#edit_database_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
