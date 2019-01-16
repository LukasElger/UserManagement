require 'rails_helper'

RSpec.describe "users/edit_profile", type: :view do
  before do
    assign(:user, FactoryBot.create(:user))
    render
  end

  it "contains a edit form for the profile" do
    assert_select "form" do
      assert_select "input[name='user[email]']"
      assert_select "input[name='user[password]']"
      assert_select "input[name='user[password_confirmation]']"
      assert_select "input[name='user[current_password]']"
      assert_select "select[name='user[locale]']"
      assert_select "input[type='submit']"
      expect(rendered).to have_css("input#delete_user_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
