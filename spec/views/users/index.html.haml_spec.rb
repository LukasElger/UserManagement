require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before do
    @user = FactoryBot.create(:user)
    users = [@user]
    elements = Kaminari.paginate_array(users).page(1)
    assign(:users, elements)
    render
  end

  it "contains a table with all headings" do
    assert_select "table" do
      expect(rendered).to have_css("tr#header_row")
      expect(rendered).to have_css("th#id_head")
      expect(rendered).to have_css("th#name_head")
      expect(rendered).to have_css("th#email_head")
      expect(rendered).to have_css("th#active_head")
      expect(rendered).to have_css("th#show_header")
      expect(rendered).to have_css("th#edit_header")
      expect(rendered).to have_css("th#delete_header")
    end
  end

  it "contains a table with all users" do
    assert_select "table" do
      expect(rendered).to have_css("tr#body_row")
      expect(rendered).to have_css("td#show_body")
      expect(rendered).to have_css("td#edit_body")
      expect(rendered).to have_css("td#delete_body")
    end
  end
end
