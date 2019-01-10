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
      expect(rendered).to have_css("th#user_id_head")
      expect(rendered).to have_css("th#user_name_head")
      expect(rendered).to have_css("th#user_email_head")
      expect(rendered).to have_css("th#show_header")
      expect(rendered).to have_css("th#edit_header")
      expect(rendered).to have_css("th#delete_header")
    end
  end

  it "contains a table with all users" do
    assert_select "table" do
      expect(rendered).to have_css("td#show_body")
      expect(rendered).to have_css("td#edit_body")
      expect(rendered).to have_css("td#delete_body")
    end
  end

  it "includes row for user" do
    expect(rendered).to have_css("tr#user_#{@user.id}")
    expect(rendered).to have_content(@user.name)
  end
end
