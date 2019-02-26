require 'rails_helper'

RSpec.describe "contur/customers/new", type: :view do
  before do
    assign(:cr, Contur::Customer.new)
    render
  end

  describe "contains an creation form for a customer" do
    it "page header content" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/customers.new.header"))
      expect(rendered).to have_selector('form', class: 'simple_form new_contur_customer')
    end
    it "form content" do
      assert_select "form" do
        assert_select "input[name='contur_customer[name]']"
        assert_select "input[name='contur_customer[email]']"
        assert_select "input[name='contur_customer[phone_number]']"
        assert_select "input[name='contur_customer[fax]']"
        assert_select "input[name='contur_customer[zip_code]']"
        assert_select "input[name='contur_customer[city]']"
        assert_select "input[name='contur_customer[street]']"
        assert_select "input[name='contur_customer[tanss_number]']"
        assert_select "textarea[name='contur_customer[comment]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains buttons" do
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
