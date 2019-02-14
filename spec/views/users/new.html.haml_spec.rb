require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before do
    assign(:user, User.new)
    render
  end

  describe "contains a creation form for a user" do
    it "header" do
      expect(rendered).to have_selector('h1', text: I18n.t("views.users.new.header"))
      expect(rendered).to have_selector('form', class: 'simple_form new_user')
    end
    it "new form content" do
      assert_select "form" do
        assert_select "input[name='user[email]']"
        assert_select "input[name='user[password]']"
        assert_select "input[name='user[password_confirmation]']"
        assert_select "input[name='user[admin]']"
        assert_select "input[name='user[account_active]']"
        assert_select "input[type='submit']"
      end
    end

    it "contains buttons" do
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
