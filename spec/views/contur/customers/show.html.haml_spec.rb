require 'rails_helper'

RSpec.describe "contur/customers/show", type: :view do
  let(:cr) { FactoryBot.create(:contur_customer) }
  before do
    assign(:cr, cr)
    render
  end

  describe "contains a table with listed customer" do

    it "contains header and card_block" do
      expect(rendered).to have_selector('div', class: 'card_block')
      expect(rendered).to have_selector('h1', text: "#{I18n.t("views.contur/customers.show.header", model: cr.name)}")
    end

    it "card_block headers" do
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:name))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:email))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:phone_number))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:fax))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:zip_code))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:city))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:street))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:tanss_number))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:server))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:databases))
      expect(rendered).to have_selector('dt', text: Contur::Customer.human_attribute_name(:comment))
    end

    it "card_block content" do
      expect(rendered).to have_selector('dd', text: "#{cr.name}")
      expect(rendered).to have_selector('dd', text: "#{cr.email}")
      expect(rendered).to have_selector('dd', text: "#{cr.phone_number}")
      expect(rendered).to have_selector('dd', text: "#{cr.fax}")
      expect(rendered).to have_selector('dd', text: "#{cr.zip_code}")
      expect(rendered).to have_selector('dd', text: "#{cr.city}")
      expect(rendered).to have_selector('dd', text: "#{cr.street}")
      expect(rendered).to have_selector('dd', text: "#{cr.tanss_number}")
      expect(rendered).to have_selector('dd', text: "#{cr.comment}")
    end

    it "contains buttons" do
      expect(rendered).to have_css("input#edit_customer_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
