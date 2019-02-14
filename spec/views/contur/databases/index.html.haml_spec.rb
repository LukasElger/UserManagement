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
      expect(rendered).to have_selector('input', id: 'SearchInput')
    end

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'default', id: 'SearchableTable')
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: Contur::Database.human_attribute_name(:url))
      expect(rendered).to have_selector('th', text: I18n.t("actions.show"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.edit"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.delete"))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{db.id}")
      expect(rendered).to have_selector('span', class: 'fas fa-globe-europe')
      expect(rendered).to have_selector('i', class: 'fas fa-search')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-trash-alt')
    end

    it "urlmodal content" do
      expect(rendered).to have_selector('div', id:'urlModal', class: 'modal fade')
      expect(rendered).to have_selector('div', class: 'modal-dialog')
      expect(rendered).to have_selector('div', class: 'modal-content')
      expect(rendered).to have_selector('div', class: 'modal-header')
      expect(rendered).to have_selector('h5', id:'exampleModalLabel', class: 'modal-title')
      expect(rendered).to have_selector('button', class: 'close')
      expect(rendered).to have_selector('div', class: 'modal-body')
      expect(rendered).to have_selector('div', class: 'modal-footer')
      expect(rendered).to have_selector('button', class: 'btn btn-secondary')
    end
  end
end
