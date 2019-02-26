require 'rails_helper'

RSpec.describe "contur/databases/index", type: :view do
  let(:db) { FactoryBot.create(:contur_database) }
  before do
    dbs = [db]
    elements = Kaminari.paginate_array(dbs).page(1)
    assign(:dbs, elements)
    render
  end

  describe "contains table with all databases" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/databases.index.header"))
    end

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'default')
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:vm_username))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:server_id))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:url))
      expect(rendered).to have_selector('th', text: I18n.t("actions.show"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.edit"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.delete"))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{db.id}")
      expect(rendered).to have_selector('td', text: "#{db.vm_username}")
      expect(rendered).to have_selector('td', text: "#{db.server_id}") 
      expect(rendered).to have_selector('span', class: 'fas fa-globe')
      expect(rendered).to have_selector('i', class: 'fas fa-search')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-trash-alt')
    end
  end
end
