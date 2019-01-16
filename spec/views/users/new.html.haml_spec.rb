require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before do
    assign(:user, User.new)
    render
  end

  it "contains a creation form for a user" do
    assert_select "form" do
      assert_select "input[name='user[name]']"
      assert_select "input[name='user[email]']"
      assert_select "input[name='user[password]']"
      assert_select "input[name='user[password_confirmation]']"
      assert_select "input[name='user[admin]']"
      assert_select "input[name='user[account_active]']"
      assert_select "input[type='submit']"
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
