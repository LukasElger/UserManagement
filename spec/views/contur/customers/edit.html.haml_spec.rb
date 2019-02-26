require 'rails_helper'

RSpec.describe "contur/customers/edit", type: :view do
  before do
    assign(:cr, FactoryBot.create(:contur_customer))
    render
  end

  describe "contains an edit form for a customer" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.contur/customers.edit.header"))
      expect(rendered).to have_selector('form', class: 'simple_form edit_contur_customer')
    end
    it "edit form content" do
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

    it "contains footer / buttons" do
      expect(rendered).to have_selector('h2', text: I18n.t("views.contur/customers.edit.footer"))
      expect(rendered).to have_css("input#delete_cr_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
