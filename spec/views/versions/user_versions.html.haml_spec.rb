require 'rails_helper'

RSpec.describe "versions/user_versions", type: :view do
  before do
    user = FactoryBot.create(:user)
    assign(:user, user)
    allow(view).to receive_messages(current_user: user)

    version = PaperTrail::Version.new
    allow(version).to receive_messages(item: user)
    assign(:versions, [version])
    render
  end

  it "contains table" do
    assert_select "table" do
      expect(rendered).to have_css("tr#header_row")
      expect(rendered).to have_css("tr#body_row")
      expect(rendered).to have_css("th#id_head")
      expect(rendered).to have_css("th#name_head")
      expect(rendered).to have_css("th#action_head")
      expect(rendered).to have_css("th#created_at_head")
    end
  end
end
