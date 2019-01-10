require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before do
    assign(:user, FactoryBot.create(:user))
    render
  end

  it "contains a table with listed users" do
    assert_select "table" do
      expect(rendered).to have_css("tr#header_row")
      expect(rendered).to have_css("tr#body_row")
      expect(rendered).to have_css("th#user_id_head")
      expect(rendered).to have_css("th#user_name_head")
      expect(rendered).to have_css("th#user_email_head")
      expect(rendered).to have_css("th#user_admin_head")
    end
  end

  it "contains buttons" do
    expect(rendered).to have_css("input#edit_user_button")
    expect(rendered).to have_css("input#back_to_root_button")
  end
end
