require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before do
    assign(:user, FactoryBot.create(:user))
    render
  end

  it "contains a edit form for a user" do
    assert_select "form" do
      assert_select "input[name='user[email]']"
      assert_select "input[name='user[password]']"
      assert_select "input[name='user[password_confirmation]']"
      assert_select "input[name='user[admin]']"
      assert_select "input[name='user[account_active]']"
      assert_select "input[type='submit']"
      expect(rendered).to have_css("input#back_to_root_button")
      expect(rendered).to have_css("input#delete_user_button")
    end
  end
end
