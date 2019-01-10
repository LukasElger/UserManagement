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
      assert_select "input[type='submit']"
    end
  end

  it "contains #sign-up-form" do
    expect(rendered).to have_css("form#new_user")
    expect(rendered).to have_css("input#back_to_root_button")
  end
end
