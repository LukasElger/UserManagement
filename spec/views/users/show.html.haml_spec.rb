require "rails_helper"

RSpec.describe "users/show", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, admin: true) }
  before do
    allow(view).to receive_messages(current_user: admin)
    assign(:user, user)
    render
  end

  describe "contains table with listed user" do

    it "card_block headers" do
      expect(rendered).to have_selector("div", class: "card_block")
      expect(rendered).to have_selector("dt", text: User.human_attribute_name(:id))
      expect(rendered).to have_selector("dt", text: User.human_attribute_name(:name))
      expect(rendered).to have_selector("dt", text: User.human_attribute_name(:email))
      expect(rendered).to have_selector("dt", text: User.human_attribute_name(:admin))
      expect(rendered).to have_selector("dt", text: User.human_attribute_name(:account_active))
    end

    it "card_block content" do
      expect(rendered).to have_selector("dd", text: "#{user.id}")
      expect(rendered).to have_selector("dd", text: "#{user.name}")
      expect(rendered).to have_selector("dd", text: "#{user.email}")
      expect(rendered).to have_selector("dd", text: "#{user.decorate.admin_human}")
      expect(rendered).to have_selector("dd", text: "#{user.decorate.active_human}")
    end

    it "contains header / footer / buttons" do
      expect(rendered).to have_selector("h1", text: I18n.t("views.users.show.header"))
      expect(rendered).to have_css("input#edit_user_button")
      expect(rendered).to have_css("input#back_to_root_button")
    end
  end
end
