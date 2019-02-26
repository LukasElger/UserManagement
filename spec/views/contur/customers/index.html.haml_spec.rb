require 'rails_helper'

RSpec.describe "contur/customers/index", type: :view do
  let(:cr) { FactoryBot.create(:contur_customer) }
  before do
    cs = [cr]
    elements = Kaminari.paginate_array(cs).page(1)
    assign(:cs, elements)
    render
  end

  describe "contains a table with all customers" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/customers.index.header"))
    end

    it "table head content" do
      expect(rendered).to have_selector('table', class: 'default')
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:id))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:name))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:email))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:phone_number))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:zip_code))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:street))
      expect(rendered).to have_selector('th', text: Contur::Customer.human_attribute_name(:tanss_number))
      expect(rendered).to have_selector('th', text: I18n.t("actions.show"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.edit"))
      expect(rendered).to have_selector('th', text: I18n.t("actions.delete"))
    end

    it "table body content" do
      expect(rendered).to have_selector('td', text: "#{cr.id}")
      expect(rendered).to have_selector('td', text: "#{cr.name}")
      expect(rendered).to have_selector('td', text: "#{cr.email}")
      expect(rendered).to have_selector('td', text: "#{cr.phone_number}")
      expect(rendered).to have_selector('td', text: "#{cr.zip_code}")
      expect(rendered).to have_selector('td', text: "#{cr.street}")
      expect(rendered).to have_selector('td', text: "#{cr.tanss_number}")
      expect(rendered).to have_selector('i', class: 'fas fa-search')
      expect(rendered).to have_selector('i', class: 'fas fa-edit')
      expect(rendered).to have_selector('i', class: 'fas fa-trash-alt')
    end
  end
end
