require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before do
    assign(:user, FactoryBot.create(:user))
    render
  end

  describe "contains a edit form for a user" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.users.edit.header"))
      expect(rendered).to have_selector('form', class: 'simple_form edit_user')
    end
    it "edit form content" do
      assert_select "form" do
        assert_select "input[name='user[email]']"
        assert_select "input[name='user[password]']"
        assert_select "input[name='user[password_confirmation]']"
        assert_select "input[name='user[admin]']"
        assert_select "input[name='user[account_active]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains footer / buttons" do
      expect(rendered).to have_selector('h2', text: I18n.t("views.users.edit.footer"))
      expect(rendered).to have_css("input#delete_user_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
